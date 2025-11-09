function sops_encrypt --wraps='sops --encrypt --age $(cat ~/.ssh/id_age | grep -oP "public key: \K(.*)") --encrypted-regex REGEX --in-place FILE_PATH' --description 'sops_encrypt $FILE_PATH $REGEX'
    sops --encrypt --age $(cat ~/.ssh/id_age | grep -oP "public key: \K(.*)") --encrypted-regex $argv[2] --in-place $argv[1]
end

