function set_env
  for line in (cat $argv | grep -v '^#')
    set item (string split -m 1 '=' $line)
    set var1 (echo $item[1] | tr -d '[:space:]')
    set var2 (echo $item[2] | tr -d '[:space:]')
    set -gx $var1 $var2
    # echo "Exported key $item[1]"
  end
end

