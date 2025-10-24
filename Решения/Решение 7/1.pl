sub http_encode(@) { + map s{\W}{+ sprintf '%%%02X', ord $&}ugeosxr, @{[@_]} }

print http_encode '#%$^&*(';