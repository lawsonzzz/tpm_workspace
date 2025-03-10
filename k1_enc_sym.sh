set -x
source env.sh
source tcti.sh
source k1_header.sh

# related files
plain=secret.txt
enc=secret.enc
dec=secret.dec

# clear privious files
rm secret.*

# Prepare and do it
this_key_ctx=${key1_ctx}
echo "Hello World" > secret.txt

tpm2_encryptdecrypt ${tcti} -c ${this_key_ctx} -o ${enc} ${plain}
tpm2_encryptdecrypt ${tcti} -d -c ${this_key_ctx} -o ${dec} ${enc}
cat ${dec}