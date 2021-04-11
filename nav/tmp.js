$(
    function(){
        io_dict = {
            day1: ["hello"], 
            day2: ["animals", "fake_div", "fib", "matrix", "my_average", "rand_guess", "sum2d", "unless"],
            day3: ["phonebook"]
        }
        for (day_num in ["day1", "day2", "day3"]){
            for (fbasename in io_dict[day_num]){
                var url_io = concat("https://raw.githubusercontent.com/Wang-Guo-Sheng/io_crash_week/main/",
                    day_num, "/", fbasename, ".html")
                var id_io = concat("#includedContent_io_crash_week_day2_", fbasename, "_io")
                $(id_io).load(url_io)
            }
        }
    }
)
