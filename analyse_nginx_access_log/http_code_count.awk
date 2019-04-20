BEGIN {
    http_code_array["http_code"] = "http_code"
}
{
    http_code = $9
    if (http_code in http_code_array) {
        http_code_array[http_code] ++
    }
    else {
        http_code_array[http_code] = 1
    }
}
END {
    for (http_code in http_code_array) {
        if (http_code == "http_code") continue
        print http_code " " http_code_array[http_code]
    }
}