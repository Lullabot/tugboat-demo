jQuery(document).ready(function($) { 
  if ($(".view-titles .flexslider").length>0) {
    $(window).load(function() {
      $(".view-titles .flexslider, .view-titles .view-content, .view-titles .more-link").fadeIn("slow");
      $(".view-titles .flexslider").flexslider({
        animation: drupalSettings.newsplus.flexsliderInternalBannerSliderInit.internalBannerEffect,        // Select your animation type, "fade" or "slide"
        slideshowSpeed: drupalSettings.newsplus.flexsliderInternalBannerSliderInit.internalBannerEffectTime,   // Set the speed of the slideshow cycling, in milliseconds
        prevText: "",           
        nextText: "",           
        pauseOnAction: false,
        useCSS: false,
        controlNav: false,
        directionNav: false
      });

    });
  }
});