(function ($, Drupal, drupalSettings) {
  Drupal.behaviors.mtOwlCarouselTestimonials = {
    attach: function (context, settings) {
      $(context).find('.mt-carousel-testimonials').once('mtOwlCarouselTestimonialsInit').each(function() {
        $(this).owlCarousel({
          items: 2,
          responsive:{
            0:{
              items:1,
            },
            480:{
              items:1,
            },
            1200:{
              items:2,
            }
          },
          autoplay: drupalSettings.magazineplus.owlCarouselTestimonialsInit.owlTestimonialsAutoPlay,
          autoplayTimeout: drupalSettings.magazineplus.owlCarouselTestimonialsInit.owlTestimonialsEffectTime,
          nav: true,
          dots: false,
          loop: true,
          navText: false
        });
      })
    }
  };
})(jQuery, Drupal, drupalSettings);
