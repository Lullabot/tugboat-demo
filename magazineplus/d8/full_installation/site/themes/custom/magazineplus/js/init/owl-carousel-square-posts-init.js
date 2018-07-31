(function ($, Drupal, drupalSettings) {
  Drupal.behaviors.mtOwlCarouselSquarePosts = {
    attach: function (context, settings) {
      $(context).find('.mt-carousel-square-posts').once('mtOwlCarouselSquarePostsInit').each(function() {
        $(this).owlCarousel({
          items: 5,
          responsive:{
            0:{
              items:1,
            },
            480:{
              items:2,
            },
            768:{
              items:2,
            },
            992:{
              items:2,
            },
            1200:{
              items:4,
            },
            1680:{
              items:5,
            }
          },
          autoplay: drupalSettings.magazineplus.owlCarouselSquarePostsInit.owlSquarePostsAutoPlay,
          autoplayTimeout: drupalSettings.magazineplus.owlCarouselSquarePostsInit.owlSquarePostsEffectTime,
          nav: true,
          dots: false,
          loop: true,
          navText: false
        });
      })
    }
  };
})(jQuery, Drupal, drupalSettings);
