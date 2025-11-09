function sops_encrypt --wraps='sops --encrypt --age $(cat KEY_FILE_PATH | grep -oP "public key: \K(.*)") --encrypted-regex '^(data|stringData)$' --in-place FILE_PATH' --description 'sops_encrypt $AGE_KEY_FILE_PATH $FILE_PATH'
    sops --encrypt --age $(cat $item[1] | grep -oP "public key: \K(.*)") --encrypted-regex '^(data|stringData)$' --in-place $item[2]
end

