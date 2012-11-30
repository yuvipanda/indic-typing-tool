active_languages = [ 'as', 'bn', 'hi', 'mr', 'gu', 'kn', 'ml', 'or', 'pa', 'ta', 'te', 'ur' ]

setIM = ( im ) ->
    ime = $( '#input' ).data( 'ime' )
    localStorage.im = im
    ime.load( im, -> ime.setIM( im ) )

getLang = ->
    localStorage.lang ? 'hi'

getIM = ->
    localStorage.im ? 'hi-transliteration'

setLang = ( lang ) ->
    localStorage.lang = lang

populateIMs = ( lang ) ->
    langData = $.ime.languages[ lang ]
    $( '#keyboards' ).empty()
    for im in langData.inputmethods
        $( '#keyboards' ).append( 
            $( '<option>' ).attr( 'value', im ).text( $.ime.sources[ im ].name )
        )

$ ->
    for lang, data of $.ime.languages
        if lang in active_languages
            $lang = $( '<option>' ).attr( 'value', lang ).text( data.autonym )
            $( '#languages' ).append( $lang );

    $( '#languages' ).change( ->
        langCode = $( this ).val()
        console.log( langCode )
        populateIMs( langCode )
        setLang( langCode )
        setIM( $( '#keyboards' ).val() )
    )

    $( '#keyboards' ).change( ->
        im = $( this ).val()
        setIM( im )
        window.stap.toggle_nav()
    )
        
    $( '#input' ).ime( {
        imePath: '/libs/jquery.ime/',
        languages: active_languages
    } )

    $( '#languages option[value="' + getLang() + '"]' ).attr( 'selected', 'selected' )
    populateIMs( getLang() )
    $( '#keyboards option[value="' + getIM() + '"]' ).attr( 'selected', 'selected' )
    setIM( getIM() )
