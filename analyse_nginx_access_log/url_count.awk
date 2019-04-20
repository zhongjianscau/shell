BEGIN {
    url_array["url"] = "url"
}
{
    split($7, array, "?")
    url = array[1]
    if (url in url_array) {
        url_array[url] ++
    }
    else {
        url_array[url] = 1
    }
}
END {
    for (url in url_array) {
        if (url == "url") continue
        print url " " url_array[url]
    }
}