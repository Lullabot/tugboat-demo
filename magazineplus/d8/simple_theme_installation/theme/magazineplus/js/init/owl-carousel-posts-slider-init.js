(function ($, Drupal, drupalSettings) {
  Drupal.behaviors.mtOwlCarouselPostsSlider = {
    attach: function (context, settings) {
      $(context).find('.mt-slider-posts').once('mtOwlCarouselPostsSliderInit').each(function() {
        $(this).owlCarousel({
          items: 1,
          autoplay: drupalSettings.magazineplus.owlCarouselPostsSliderInit.owlPostsSliderAutoPlay,
          autoplayTimeout: drupalSettings.magazineplus.owlCarouselPostsSliderInit.owlPostsSliderEffectTime,
          nav: true,
          dots: false,
          loop: true,
          navText: false
        });
      })
    }
  };
})(jQuery, Drupal, drupalSettings);