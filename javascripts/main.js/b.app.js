$(document).ready(function() {
    (function(H){H.className=H.className.replace(/\bno-sidetap\b/,'sidetap')})(document.documentElement);

    //create instance of Sidetap
    var st = sidetap();

    window.stap = st;

    // bind user interface elements

    $(".header-button.menu").on("click",st.toggle_nav);
    
    $('.header-button.info').click(function() {
        return st.show_section($("#about"), {
            animation: 'upfrombottom'
        });
    });
    $('#about a.cancel').click(function() {
        return st.show_section($("#index"), {
            animation: 'downfromtop'
        });
    });

    st.stp_nav.find('nav a').click(function() {
      if( $(this).attr("href") ) {
          $(this).addClass('selected').siblings().removeClass('selected');
          st.toggle_nav();
          var $section = $($(this).attr("href"));
          st.show_section($section);
          return false;
      }
    });
});
