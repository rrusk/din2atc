import csv

__author__ = 'rrusk'


def create_dict(csv_file, key_field, value_field):
    the_dict = {}
    with open(csv_file, 'rb') as f:
        reader = csv.reader(f, delimiter=',', quotechar='"')
        default = None
        for row in reader:
            prev_value = the_dict.get(row[key_field], default)
            if prev_value and prev_value != row[value_field]:
                print("Problem with key " + row[key_field] + " having two different values:" + row[
                    value_field] + " and " + str(prev_value))
            the_dict[row[key_field]] = row[value_field]
    return the_dict


def create_din_atc_dict(din_dict, atc_dict):
    din_atc_dict = {}
    default = None
    for key in din_dict:
        prev_value = din_atc_dict.get(key, default)
        next_value = atc_dict.get(key, default)
        if prev_value and prev_value != next_value:
            print("din: " + str(key) + " has values: " + str(prev_value) + " and " + str(next_value))
        din_atc_dict[din_dict[key]] = next_value
    return din_atc_dict


def main():
    din_dict = create_dict('data/drug.txt', 0, 3)
    din_dict.update(create_dict('data/drug_ia.txt', 0, 3))
    atc_dict = create_dict('data/ther.txt', 0, 1)
    atc_dict.update(create_dict('data/ther_ia.txt', 0, 1))
    din_atc_dict = create_din_atc_dict(din_dict, atc_dict)

    cnt_no_atc = 0
    for key in din_atc_dict:
        if not din_atc_dict[key]:
            cnt_no_atc += 1
    print("din codes: " + str(len(din_atc_dict)) + ", din codes without atc:" + str(cnt_no_atc))

    out_file = "results/din2atc.txt"

    num_keys = len(din_atc_dict)
    cnt = 0
    try:
        with open(out_file, 'w') as f:
            f.write("[")
            for key in din_atc_dict:
                f.write("{\"din\":\"" + str(key) + "\", \"atc\":\"" + str(din_atc_dict[key]) + "\"}")
                if cnt < num_keys - 1:
                    f.write(",")
                cnt += 1
            f.write("]")
        print("File '" + str(out_file) + "' can be imported into mongo using something like: ")
        print("mongoimport --jsonArray --db the_mongo_db --collection the_collection --drop --file din2atc.txt")

    except IOError as e:
        print("Error %d: %s '%s'" % (e.args[0], e.args[1], e.filename))


if __name__ == '__main__':
    main()
