(function ($, Drupal, drupalSettings) {
  Drupal.behaviors.mtIsotopePostsMasonry = {
    attach: function (context, settings) {

      //posts masonry
      $(context).find('.posts-masonry-container').once('mtIsotopePostsMasonryInit').each(function() {
        var $this = $(this);
        $this.fadeIn("slow");

        // load images first
        $this.imagesLoaded(function() {
          var blockId = $this.closest(".block").attr('id'),
          masonryItem = "#" + blockId + " .masonry-item";
          $this.isotope({
            itemSelector: masonryItem,
            layoutMode: "masonry",
            masonry: {
              columnWidth: ".col-md-3"
            }
          });
          $this.isotope("layout");
        });

        // initialise inside bootstrap tab
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
          $this.isotope('layout');
        });
      });

    }
  };
})(jQuery, Drupal, drupalSettings);
