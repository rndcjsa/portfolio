cat << EOL > cert.conf
[req]
default_bits       = 4096
default_keyfile    = wsl.key
distinguished_name = req_distinguished_name
req_extensions     = req_ext
x509_extensions    = v3_ca

[req_distinguished_name]
countryName                 = Country Name (2 letter code)
countryName_default         = US
stateOrProvinceName         = State or Province Name (full name)
stateOrProvinceName_default = New York
localityName                = Locality Name (eg, city)
localityName_default        = Rochester
organizationName            = Organization Name (eg, company)
organizationName_default    = wsl
organizationalUnitName      = organizationalunit
organizationalUnitName_default = Development
commonName                  = Common Name (e.g. server FQDN or YOUR name)
commonName_default          = wsl
commonName_max              = 64

[req_ext]
subjectAltName = @alt_names

[v3_ca]
subjectAltName = @alt_names

[alt_names]
DNS.1   = wsl
DNS.2   = 127.0.0.1
EOL
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout cert.key -out cert.crt -config cert.conf -passin pass:1234
openssl pkcs12 -export -out cert.pfx -inkey cert.key -in cert.crt