// $(function() {
//   var url = "https://raw.githubusercontent.com/Wang-Guo-Sheng/ruby_crash_week/main/day1/hello_world.rb";
//   $.get(url, function(data,status){
//     console.log(data)
//     $("#includedContent_2021_03_31_22_19").append(data.replace('\n','<p>'));
//   });
// });

$(function(){
    var url_2021_03_31_22_19 = "https://raw.githubusercontent.com/Wang-Guo-Sheng/ruby_crash_week/main/day1/hello_world.html";
    $("includedContent_2021_03_31_22_19").load(url_2021_03_31_22_19)
})
