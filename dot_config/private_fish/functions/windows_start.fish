function windows_start --wraps='virsh --connect qemu:///system start "win11"' --description 'virsh --connect qemu:///system start "win11"'
    virsh --connect qemu:///system start "win11"
end

