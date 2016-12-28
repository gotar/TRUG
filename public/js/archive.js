var archive = (function() {
  playerTemplate = function( movieId, provider ) {
    return $("<iframe />", {
      src: movieUrl(movieId, provider),
      width: 460,
      height: 259,
      frameborder: 0,
    });
  }

  movieUrl = function( movieId, provider ) {
    if( provider == "youtube" ) {
      return "http://www.youtube.com/embed/" + movieId + "/?autoplay=1&rel=0";
    } else {
      return "http://player.vimeo.com/video/" + movieId + "?autoplay=true";
    }
  }

  playVideo = function( event ) {
    event.preventDefault();
    var $videoBox = $(this).parents('.video'),
        player = playerTemplate( $videoBox.data('video_id'), $videoBox.data('provider') );
    $videoBox.append( player );
    $videoBox.find('.play, img').hide();
  }

  return {
    init: function() {
      $(".meetup img, .meetup .play").on( "click", playVideo );
    }
  }
})();

$(function() {
  archive.init();
})
