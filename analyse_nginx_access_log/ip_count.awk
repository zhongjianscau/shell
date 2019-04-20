BEGIN {
    ip_array["ip"] = "ip";
}
{
    ip = $1
    if (ip in ip_array) {
        ip_array[ip] ++
    }
    else {
        ip_array[ip] = 1
    }
}
END {
    for (ip in ip_array) {
        if (ip == "ip") continue
        print ip " " ip_array[ip]
    }
}