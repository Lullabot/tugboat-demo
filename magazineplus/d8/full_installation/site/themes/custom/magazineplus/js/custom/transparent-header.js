jQuery(document).ready(function($) {
  if($(".slideshow-fullscreen").length>0) {
    $(".header-container").addClass("js-transparent-header");
  } else {
    $(".header-container").removeClass("js-transparent-header");
  };
  if ($(".header-container.js-transparent-header header.header").length>0) {
    var color = $(".header-container.js-transparent-header header.header").css("background-color").replace(")", "," + drupalSettings.magazineplus.transparentHeader.transparentHeaderOpacity + ")").replace("rgb", "rgba");
    $(".header-container.js-transparent-header header.header").css("background-color", color);
  }
  if ($(".header-container.js-transparent-header .header-top").length>0) {
    var color = $(".header-container.js-transparent-header .header-top").css("background-color").replace(")", "," + drupalSettings.magazineplus.transparentHeader.transparentHeaderOpacity + ")").replace("rgb", "rgba");
    $(".header-container.js-transparent-header .header-top").css("background-color", color);
  }
  if ($(".header-container.js-transparent-header .header-top-highlighted").length>0) {
    var color = $(".header-container.js-transparent-header .header-top-highlighted").css("background-color").replace(")", "," + drupalSettings.magazineplus.transparentHeader.transparentHeaderOpacity + ")").replace("rgb", "rgba");
    $(".header-container.js-transparent-header .header-top-highlighted").css("background-color", color);
  }
});
