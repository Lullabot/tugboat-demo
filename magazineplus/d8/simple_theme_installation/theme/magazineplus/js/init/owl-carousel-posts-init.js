(function ($, Drupal, drupalSettings) {
  Drupal.behaviors.mtOwlCarouselPosts = {
    attach: function (context, settings) {
      $(context).find('.mt-carousel-posts').once('mtOwlCarouselPostsInit').each(function() {
        $(this).owlCarousel({
          items: 4,
          responsive:{
            0:{
              items:1,
            },
            480:{
              items:2,
            },
            768:{
              items:3,
            },
            992:{
              items:2,
            },
            1200:{
              items:3,
            },
            1680:{
              items:4,
            }
          },
          autoplay: drupalSettings.magazineplus.owlCarouselPostsInit.owlPostsAutoPlay,
          autoplayTimeout: drupalSettings.magazineplus.owlCarouselPostsInit.owlPostsEffectTime,
          nav: true,
          dots: false,
          loop: true,
          navText: false
        });
      });
    }
  };
})(jQuery, Drupal, drupalSettings);