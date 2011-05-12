<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:guide="http://adeprimo.se/integration/guide"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="guide">
  <xsl:output encoding="UTF-8" indent="no" method="html" omit-xml-declaration="yes"/>
  <xsl:variable name="site-root" select="'http://lunchguiden.labbplats.se/assets/Uploads'"/>
  <xsl:variable name="file-root" select="'http://lunchguiden.labbplats.se/themes/lunchguide/rds'"/>
  <xsl:variable name="spotid"><xsl:text disable-output-escaping="yes">{{ SpotId }}</xsl:text></xsl:variable>
  <xsl:variable name="img"><xsl:text disable-output-escaping="yes">{{ img }}</xsl:text></xsl:variable>
  <xsl:variable name="name"><xsl:text disable-output-escaping="yes">{{ Name }}</xsl:text></xsl:variable>
  <xsl:variable name="phone"><xsl:text disable-output-escaping="yes">{{ Phone }}</xsl:text></xsl:variable>
  <xsl:variable name="id"><xsl:text disable-output-escaping="yes">{{ Id }}</xsl:text></xsl:variable>
  <xsl:variable name="value"><xsl:text disable-output-escaping="yes">{{ value }}</xsl:text></xsl:variable>
  <xsl:variable name="mail"><xsl:text disable-output-escaping="yes">{{ Email }}</xsl:text></xsl:variable>
  <xsl:variable name="url"><xsl:text disable-output-escaping="yes">{{ URL }}</xsl:text></xsl:variable>
  
  <xsl:template match="/">
      <script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.js"></script>
      <link rel="stylesheet" href="{$file-root}/styles.css" />
      <div class="guide-outer"><div class="guide-shadow">
      <div id="guide-wrapper">
        <div class="header">
          <div class="description">
            <a class="logo" href="#">
              <img src="{$file-root}/logo.png" alt="LunchGuiden" />
            </a>
          </div>
          <div class="filter">
            <form id="FilterForm" action="#" method="get">
              <div class="line">
              
                <div class="unit">
                  <label for="guide-search" class="structural">Fritexts&#246;k</label>
                  <input type="text" placeholder="Valfria s&#246;kord" autofocus="autofocus" name="Needle" id="guide-search"></input>
                  <input type="submit" value="Ok" class="submit-button" />
                </div>
              
                <fieldset class="unit" id="food-categories">
                  <div class="unit">
                    <input class="food-category" id="guide-event-categories-all" checked="checked" type="radio" value="alla" name="ECategories" />
                    <label class="food-category-label" for="guide-event-categories-all">Alla r&#228;tter</label>
                  </div>
                  <div class="unit">
                    <input class="food-category" id="guide-event-categories-veg" type="radio" value="vegetarisk" name="ECategories" />
                    <label class="food-category-label" for="guide-event-categories-veg">Vegetariskt</label>
                  </div>
                  <div class="unit">
                    <input class="food-category" id="guide-event-categories-key" type="radio"  value="nyckelhal" name="ECategories" />
                    <label class="food-category-label" for="guide-event-categories-key">Nyckelh&#229;l</label>
                  </div>
                </fieldset>
              </div>

              <div class="line" id="guide-datepicker">
                <div class="unit">
                  <input type="radio" id="dp-2011-04-05" name="DateFrom" value="2011-04-05" checked="checked"/>
                  <label for="dp-2011-04-05" class="dp-label dp-label-selected">Idag</label>
                </div>
                <div class="unit">
                  <input type="radio" id="dp-2011-04-06" name="DateFrom" value="2011-04-06" />
                  <label for="dp-2011-04-06" class="dp-label">Imorgon</label>
                </div>
              </div>

              <fieldset id="spot-categories" class="unit">
                <h3 class="filter-heading">Filtrera:</h3>
                <div class="unit">
                  <input id="guide-categories-wifi" type="checkbox" value="Wi-Fi" name="Categories[Wi-Fi]" />
                  <label for="guide-categories-wifi" class="guide-category-wifi" title="Filtrera p&#229; restauranger med tr&#229;dl&#246;st Internet">Wi-Fi</label>
                </div>
                <div class="unit">
                  <input id="guide-categories-alcohol" type="checkbox"  value="Alkoholtillst&#229;nd" name="Categories[Alkoholtillst&#229;nd]" />
                  <label class="guide-category-alcohol" for="guide-categories-alcohol" title="Filtrera p&#229; restauranger med alkoholtillst&#229;nd">Alkoholtillst&#229;nd</label>
                </div>
                <div class="unit">
                  <input id="guide-categories-kaffe" type="checkbox" value="Kaffe ing&#229;r" name="Categories[Kaffe ing&#229;r]" />
                  <label class="guide-category-kaffe" for="guide-categories-kaffe" title="Filtrera p&#229; restauranger d&#228;r kaffe ing&#229;r i lunchen">Kaffe ing&#229;r</label>
                </div>
                <div class="unit">
                  <input id="guide-categories-cardpayment" type="checkbox" value="Kortbetalning" name="Categories[Kortbetalning]" />
                  <label class="guide-category-cardpayment" for="guide-categories-cardpayment" title="Filtrera p&#229; restauranger d&#228;r kortbetalning &#228;r m&#246;jlig">Kortbetalning</label>
                </div>
                <div class="unit">
                  <input id="guide-categories-handicap" type="checkbox" value="Handikappanpassat" name="Categories[Handikappanpassat]" />
                  <label class="guide-category-handicap" for="guide-categories-handicap" title="Filtrera p&#229; restauranger som &#228;r handikappanpassade">Handikappanpassat</label>
                </div>
              </fieldset>
            </form>
          </div>
          <div class="mobil-link-hp"><a href="http://m.lunchguiden.hallandsposten.se/" title="Surfar du p&#229; mobiltelefon&#63; &#214;ppna v&#229;r mobilsajt ist&#228;llet&#33;">Till Lunchguidens mobilsajt</a></div>
          <div class="mobil-link-hn"><a href="http://m.lunchguiden.hn.se/" title="Surfar du p&#229; mobiltelefon&#63; &#214;ppna v&#229;r mobilsajt ist&#228;llet&#33;">Till Lunchguidens mobilsajt</a></div>
          <div class="mobil-link-ttela"><a href="http://m.lunchguiden.ttela.se/" title="Surfar du p&#229; mobiltelefon&#63; &#214;ppna v&#229;r mobilsajt ist&#228;llet&#33;">Till Lunchguidens mobilsajt</a></div>
          <div class="mobil-link-bohu"><a href="http://m.lunchguiden.bohuslaningen.se/" title="Surfar du p&#229; mobiltelefon&#63; &#214;ppna v&#229;r mobilsajt ist&#228;llet&#33;">Till Lunchguidens mobilsajt</a></div>
        </div>
        <div id="guide-ad-1">
        	<div id="PubTop2"></div>
        </div>
        <div class="luncher line">
          <div class="resultat line">
            <h2 class="summary unit" id="guide-results-summary">Visar tr&#228;ffar 1-<span id="guide-results-count"><xsl:value-of select="0+count(//guide:GuideSpot)" /></span></h2>
            <div id="guide-loader"></div>
            <div class="views">
              <h3 class="unit">Visa resultat som</h3>
              <a id="as-grid" href="#guide-results" class="unit view-item view-item-selected">Galleri</a>
              <a id="as-list" href="#guide-results" class="unit view-item view-item-list">Lista</a>
            </div>
          </div>
          <div class="line krogare-galleri" id="guide-results">
            <xsl:apply-templates select="//guide:GuideSpot">
              <xsl:sort select="guide:Name" case-order="upper-first" order="ascending"/>
            </xsl:apply-templates>
          </div>
        </div>
      </div>
      </div>
    </div>
    
    <script id="lunchmall" type="text/html">
      <div>
        <div class="galleri-item">
          <div class="item-inner">
            <div class="img-logo"><img class="item-image show-detailed-second" src="{$site-root}/{$img}" alt=""/></div>
            <h2 class="krogare-logo"><a href="#" id="{$spotid}" class="block-link show-detailed">
              {{ SpotName }}</a></h2>
            <div class="lunch-text">{{ Description }}</div>
			<div class="lunch-pris">{{ OtherInfo }}</div>
            <div class="vcard">
              <dl>
                <dt class="icon icon-more fn">{{ SpotName }}</dt>
                <dd><a class="show-detailed-second" href="#{$name}">F&#246;retagspresentation</a></dd>
                <dt class="icon icon-address">Adress</dt>
                <dd class="adr">{{ Address }}</dd>
                <dt class="icon icon-phone">Telefon</dt>
                <dd><a href="tel: {$phone}" class="tel">{{ Phone }}</a></dd>
				<dt class="icon icon-mail"></dt>
                <dd><a class="email" href="mailto:{$mail}" title="E-postadress">{{ Email }}</a></dd>
				<dt class="icon icon-url"></dt>
                <dd><a class="url" href="{$url}" title="G&#229; till hemsidan" target="_blank">{{ URL }}</a></dd>				
              </dl>
            </div>
          </div>
        </div>
      </div>
    </script>
    <script id="lunchmallfav" type="text/html">
      <div>
        <div class="galleri-item">
          <div class="item-inner">
            <div class="img-logo"><img class="item-image show-detailed-second" src="{$site-root}/{$img}" alt=""/></div>
            <h2 class="krogare-logo"><a href="#" id="{$spotid}" class="block-link show-detailed">
              {{ SpotName }}</a></h2>

            <div class="lunch-text">{{ Description }}</div>
			<div class="lunch-pris">{{ OtherInfo }}</div>
            <div class="vcard">
              <dl>
                <dt class="icon icon-more fn">{{ SpotName }}</dt>
                <dd><a class="show-detailed-second" href="#{$name}">F&#246;retagspresentation</a></dd>
                <dt class="icon icon-address">Adress</dt>
                <dd class="adr">{{ Address }}</dd>
                <dt class="icon icon-phone">Telefon</dt>
                <dd><a href="tel: {$phone}" class="tel">{{ Phone }}</a></dd>
				<dt class="icon icon-mail"></dt>
                <dd><a class="email" href="mailto:{$mail}" title="E-postadress">{{ Email }}</a></dd>
				<dt class="icon icon-url"></dt>
                <dd><a class="url" href="{$url}" title="G&#229; till hemsidan" target="_blank">{{ URL }}</a></dd>											
              </dl>
            </div>
            <div class="favorite"></div>
          </div>
        </div>
      </div>
    </script>
    
    <script id="modallunchmall" type="text/html">
      <div>
      <div class="unit">
        <h3 class="modal-veckodag"></h3>
        <div class="lunch-text">{{ Description }}</div>
      </div></div>
    </script>
    
    <script id="dagmallfav" type="text/html">
      <div><div class="unit">
        <input type="radio" id="dp-{$value}" name="DateFrom" value="{$value}" checked="checked"/>
        <label for="dp-{$value}" class="dp-label dp-label-selected">{{ label }}</label>
      </div></div>
    </script>
    
    <script id="dagmall" type="text/html">
      <div><div class="unit">
        <input type="radio" id="dp-{$value}" name="DateFrom" value="{$value}" />
        <label for="dp-{$value}" class="dp-label">{{ label }}</label>
      </div></div>
    </script>
    
    <script id="bildmall" type="text/html">
      <div><div class="unit">
        <img class="restaurant-image" alt="" src="{$site-root}/{$img}"/>
      </div></div>
    </script>
    
    <script id="detaljmall" type="text/html">
      <div>
        <div id="guide-modal-content">
          <a id="close-guide-modal" class="block-link" href="#">x</a>
          <div id="guide-modal-inner">
            <h2 class="structural">{{ Name }}</h2>
            <div class="restaurant-images line">
              {{ bilder }}
            </div>
			<div class="modal-weekdays">
              {{ yield }}
			</div>
			<div class="lunch-pris">{{ OtherInfo }}</div>
			<div class="clearer-description">
              <p>{{ Description }}</p>
              <p class="vcard">
                {{ Address }}
                &#183;
                Telefon: <a class="tel" href="tel:{$phone}">{{ Phone }}</a>
                &#183;
                E-post: <a class="email" href="mailto:{$mail}">{{ Email }}</a>
                &#183;
                <a class="url" href="{$url}" target="_blank" title="G&#229; till hemsidan">{{ URL }}</a>
              </p>
            </div>
            <a href="#" id="{$id}" class="block-link add-to-favorites">G&#246;r till favorit</a>
          </div>
        </div>
      </div>
    </script>
  </xsl:template>

  <xsl:template match="guide:GuideSpot">
    <div class="galleri-item">
      <div class="item-inner">
        <a href="#{guide:Name}" class="block-link show-detailed">
          <xsl:if test="guide:Images/guide:Image[guide:IsTeaser/text()='true']">
            <xsl:variable name="image-path" select="guide:Images/guide:Image[guide:IsTeaser/text()='true']/guide:Src"/>
            <xsl:variable name="image-alt" select="guide:Images/guide:Image[guide:IsTeaser/text()='true']/guide:Alt"/>
            <img class="item-image show-detailed" src="{$site-root}/{$image-path}" alt="{$image-alt}"/>
          </xsl:if>
        </a>
        <h3 class="krogare-logo">
          <a href="#{guide:Name}" id="{guide:Id}" class="block-link show-detailed">
            <xsl:value-of select="guide:Name"/>
          </a>
        </h3>
        <xsl:if test="guide:Events/guide:Event[1]/guide:Id">
          <div class="lunch-text">
            <xsl:value-of select="guide:Events/guide:Event[1]/guide:Description" disable-output-escaping="yes" />
          </div>
        </xsl:if>
      </div>
      <div class="lunch-pris"><xsl:value-of select="guide:OtherInfo" /></div>
      <div class="vcard">
        <dl>
          <dt class="icon icon-more fn"><xsl:value-of select="guide:Name" /></dt>
          <dd><a class="show-detailed" href="#{guide:Name}">F&#246;retagspresentation</a></dd>
          
          <dt class="icon icon-address">Adress</dt>
          <dd class="adr"><xsl:value-of select="guide:Address" /></dd>
          <dt class="icon icon-phone">Telefon</dt>
          <dd><a href="{guide:Phone}" class="tel"><xsl:value-of select="guide:Phone" /></a></dd>
        </dl>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>