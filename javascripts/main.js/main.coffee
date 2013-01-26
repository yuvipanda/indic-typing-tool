active_languages = [ 'as', 'bn', 'hi', 'mr', 'gu', 'kn', 'ml', 'or', 'pa', 'ta', 'te', 'ur' ]

setIM = ( im ) ->
    ime = $( '#input' ).data( 'ime' )
    localStorage.im = im
    ime.load( im, -> ime.setIM( im ) )

getLang = ->
    localStorage.lang ? 'hi'

getIM = ->
    localStorage.im ? 'hi-transliteration'

$ ->
    $.ajaxSetup( cache: true )

    $( window ).resize( ->
        $( '#input' ).height( $( window ).height() ).width( $( window ).width() ).css( 'margin-top', '48px' )
    )

    $( '#input' ).ime( {
        imePath: 'libs/jquery.ime/',
        languages: active_languages
    } ).keyup( ->
        localStorage.curText = $( this ).val()
    ).text( localStorage.curText ? '' )


    for lang, data of $.ime.languages
        if lang in active_languages
            $lang = $( '<select>' )
            $a = $( '<a>' ).append( $lang )
            for im in data.inputmethods
                $lang.append(
                    $( '<option>').attr( 'value', im ).text( data.autonym + ' - ' + $.ime.sources[ im ].name )
                )
                if getIM() == im
                    $a.addClass( 'selected' )
                    console.log( im )
                    setIM( im )
            $( '#nav' ).append( $a )


    $( '#nav select' ).change( ->
        im = $( this ).val()
        setIM( im )
        $( '#nav a.selected' ).removeClass( 'selected' )
        $( this ).parent( 'a' ).addClass( 'selected' )
    ).focus( -> $( this ).change() )
    $( window ).trigger( 'resize' )
        
