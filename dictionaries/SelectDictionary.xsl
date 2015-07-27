<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="dict" select="''"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <!-- Tab title -->
        </title>
        <link href="../styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="htmlExportStyleSheet.css"/>
      </head>
      <body>
        <xsl:text>Please select dictionary languages: </xsl:text>
        <xsl:if test="$dict='japhug'">
          <form id="form" name="form" action="ViewDictionary.php">
            <p>
              <input type="checkbox" name="lang1" id="lang1" value="fra" checked="checked"/>
              <label for="lang1"> French</label>
            </p>
            <p>
              <input type="checkbox" name="langn" id="langn" value="cmn" checked="checked"/>
              <label for="langn"> Chinese</label>
            </p>
            <p>
              <input type="submit" name="dict" id="dict" value="japhug"/>
            </p>
          </form>
        </xsl:if>
        <xsl:if test="$dict='khaling'">
          <form id="form" name="form" action="ViewDictionary.php">
            <p>
              <input type="checkbox" name="lang1" id="lang1" value="eng" checked="checked"/>
              <label for="lang1"> English</label>
            </p>
            <p>
              <input type="checkbox" name="langn" id="langn" value="cmn" checked="checked"/>
              <label for="langn"> Nepali</label>
            </p>
            <p>
              <input type="submit" name="dict" id="dict" value="khaling"/>
            </p>
          </form>
        </xsl:if>
        <xsl:if test="$dict='na'">
          <form id="form" name="form" action="ViewDictionary.php">
            <p>
              <input type="checkbox" name="lang1" id="lang1" value="eng" checked="checked"/>
              <label for="lang1"> English</label>
            </p>
            <p>
              <input type="checkbox" name="lang2" id="lang2" value="fra"/>
              <label for="lang2"> French</label>
            </p>
            <p>
              <input type="checkbox" name="langn" id="langn" value="cmn" checked="checked"/>
              <label for="langn"> Chinese</label>
            </p>
            <p>
              <input type="submit" name="dict" id="dict" value="na"/>
            </p>
          </form>
        </xsl:if>
        <!-- Introduction -->
        <xsl:if test="$dict='japhug'">
          <p>Ce dictionnaire décrit le lexique de la langue japhug (<span class="vernacular">kɯrɯ
              skɤt</span>), parlée dans la région de Japhug (<span class="national">茶堡</span>, <span
              class="vernacular">tɕɤpʰɯ</span>) au district de Mbarkhams (<span class="national"
              >马尔康县</span>), préfecture de Rngaba (<span class="national">阿坝州</span>) au Sichuan en
            Chine, dans les cantons de Gdongbrgyad (<span class="national">龙尔甲乡</span>, <span
              class="vernacular">ʁdɯrɟɤt</span>), Gsarrdzong (<span class="national">沙尔宗乡</span>,
              <span class="vernacular">sarndzu</span>) de Datshang (<span class="national"
              >大藏乡</span>, <span class="vernacular">tatshi</span>). Seul le dialecte de Kamnyu
              (<span class="national">干木鸟村</span>, <span class="vernacular">kɤmɲɯ</span>) est
            représenté dans ce dictionnaire. Cette langue a déjà fait l'objet d'une courte
            description grammaticale (<a href="#jacques08">[1]</a>) ainsi que d'un recueil
            d'histoires traditionnelles (<a href="#jacques10gesar">[2]</a>). Un corpus de texte plus
            important est en cours de publication sur l'archive Pangloss (<a
              href="#michailovsky14pangloss">[3]</a>).</p>
          <p>Ce travail est basé sur les matériaux recueillis à Mbarkhams par l'auteur auprès de
            Tshendzin (Chenzhen <span class="national">陈珍</span>) et Dpalcan (Baierqing <span
              class="national">柏儿青</span>) depuis juillet 2002. Une grande partie des mots, en
            particulier les verbes et les idéophones, sont illustrés par des exemples enregistrés
            représentatifs, dont certains proviennent de conversations ou d'histoires
            traditionnelles.</p>
          <p>Chaque entrée du dictionnaire contient une définition en français et en chinois ainsi
            que la partie du discours du mot, parmi les suivantes : <ul>
              <li><i>adv</i> adverbe</li>
              <li><i>clf</i> classificateur</li>
              <li><i>idph</i> idéophone</li>
              <li><i>intj</i> interjection</li>
              <li><i>n</i> nom</li>
              <li><i>np</i> nom inaliéanablement possédé</li>
              <li><i>postp</i> postposition</li>
              <li><i>pro</i> pronom</li>
              <li><i>vi</i> verbe intransitif</li>
              <li><i>vinh</i> verbe intransitif sans sujet humain</li>
              <li><i>vi-t</i> verbe semi-transitif</li>
              <li><i>vs</i> verbe statif</li>
              <li><i>vt</i> verbe transitif</li>
            </ul> Le numéro qui suit <i>idph</i> correspond au patron idéophonique (selon la
            classification décrite dans <a href="#japhug14ideophones">[4]</a>).</p>
          <p>Les verbes contiennent après <i>dir</i> le ou les préfixes directionnels utilisés pour
            former les tiroirs verbaux (décrits dans <a href="#jacques14linking">[5]</a>). Le
            symbole \_ est utilisé pour les verbes de mouvement, de manipulation ou d'action
            concrète compatibles avec les sept séries de préfixes. Pour les verbes irréguliers (tels
            que <span class="vernacular">ɕe</span> `aller' ou <span class="vernacular">ɣɤʑu</span>
            `exister'), les formes non-prévisibles (thème du passé, seconde personne ou
            générique).</p>
          <p>Les dérivations verbales sont indiquées par les abréviations suivantes (voir <a
              href="#jacques12incorp">[6]</a>, <a href="#jacques13tropative">[7]</a>, <a
              href="#jacques14antipassive">[8]</a>, <a href="#jacques15spontaneous">[9]</a>, <a
              href="#jacques15causative">[10]</a>) : <ul>
              <li><span class="sc">acaus</span> anticausatif</li>
              <li><span class="sc">apass</span> antipassif</li>
              <li><span class="sc">appl</span> applicatif</li>
              <li><span class="sc">autoben</span> autobénéfactif-spontané</li>
              <li><span class="sc">caus</span> causatif</li>
              <li><span class="sc">comp</span> composé</li>
              <li><span class="sc">deexp</span> dé-expérienceur</li>
              <li><span class="sc">deidph</span> déidéophonique</li>
              <li><span class="sc">denom</span> dénominal</li>
              <li><span class="sc">facil</span> facilitatif</li>
              <li><span class="sc">incorp</span> incorporation</li>
              <li><span class="sc">n.orient</span> action non-orientée</li>
              <li><span class="sc">pass</span> passif</li>
              <li><span class="sc">recip</span> réciproque</li>
              <li><span class="sc">refl</span> réfléchi</li>
              <li><span class="sc">trop</span> tropatif</li>
              <li><span class="sc">vert</span> vertitif</li>
            </ul> Ce dictionnaire a bénéficié des corrections de nombreux collègues et étudiants, en
            particulier Gong Xun, Peng Guozhen, Zhang Shuya.</p>
          <p>Ce travail a été financé par le projet ANR HimalCo (ANR-12-CORP-0006) et est en
            relation avec le projet de recherche LR-4.11 ‘‘Automatic Paradigm Generation and
            Language Description’’ du Labex EFL (fondé par l'ANR/CGI)</p>
          <!-- Bibliography -->
          <div class="content">
            <h3>Bibliographie</h3>
            <dl>
              <dt class="Key" id="jacques08">[1]</dt>
              <dd class="Pub">
                <span class="Title">{J}iarongyu yanjiu <span class="national">嘉絨語研究</span> ({S}tudy
                  on the {R}gyalrong language)</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal"/>
                <span class="Volume"/>
                <span class="Pages"/> (<span class="Date">2008</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="jacques10gesar">[2]</dt>
              <dd class="Pub">
                <span class="Title">{U}ne version rgyalrong de l'épopée de {G}esar</span><br/>
                <span class="Author">G. Jacques and Z. Chen</span><br/>
                <span class="Journal"/>
                <span class="Volume"/>
                <span class="Pages">332</span> (<span class="Date">2010</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="michailovsky14pangloss">[3]</dt>
              <dd class="Pub">
                <span class="Title">{D}ocumenting and researching endangered languages: the
                  {P}angloss {C}ollection</span><br/>
                <span class="Author">B. Michailovsky and M. Mazaudon and A. Michaud and S. Guillaume
                  and A. François and E. Adamou</span><br/>
                <span class="Journal">Language Documentation and Conservation</span>
                <span class="Volume">8</span>
                <span class="Pages">119–135</span> (<span class="Date">2014</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="japhug14ideophones">[4]</dt>
              <dd class="Pub">
                <span class="Title">{I}deophones in {J}aphug {R}gyalrong</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal">Anthropological Linguistics</span>
                <span class="Volume">55.3</span>
                <span class="Pages">256-287</span> (<span class="Date">2013</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="jacques14linking">[5]</dt>
              <dd class="Pub">
                <span class="Title">{C}lause linking in {J}aphug {R}gyalrong</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal">Linguistics of the Tibeto-Burman Area</span>
                <span class="Volume">37.2</span>
                <span class="Pages">263-327</span> (<span class="Date">2014</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="jacques12incorp">[6]</dt>
              <dd class="Pub">
                <span class="Title">{F}rom denominal derivation to incorporation</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal">Lingua</span>
                <span class="Volume">122.11</span>
                <span class="Pages">1207-1231</span> (<span class="Date">2012</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="jacques13tropative">[7]</dt>
              <dd class="Pub">
                <span class="Title">{A}pplicative and tropative derivations in {J}aphug
                  {R}gyalrong</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal">Linguistics of the Tibeto-Burman Area</span>
                <span class="Volume">36.2</span>
                <span class="Pages">1-13</span> (<span class="Date">2013</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="jacques14antipassive">[8]</dt>
              <dd class="Pub">
                <span class="Title">{D}enominal affixes as sources of antipassive markers in
                  {J}aphug {R}gyalrong</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal">Lingua</span>
                <span class="Volume">138</span>
                <span class="Pages">1-22</span> (<span class="Date">2014</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="jacques15spontaneous">[9]</dt>
              <dd class="Pub">
                <span class="Title">{T}he spontaneous- autobenefactive prefix in {J}aphug
                  {R}gyalrong</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal">Linguistics of the Tibeto Burman Area</span>
                <span class="Volume"/>
                <span class="Pages"/> (<span class="Date">to appear</span>)<br/>
                <div class="Abstract"/>
              </dd>
              <dt class="Key" id="jacques15causative">[10]</dt>
              <dd class="Pub">
                <span class="Title">{T}he origin of the causative prefix in {R}gyalrong languages
                  and its implication for proto-{S}ino-{T}ibetan reconstruction</span><br/>
                <span class="Author">G. Jacques</span><br/>
                <span class="Journal">Folia Linguistica Historica</span>
                <span class="Volume"/>
                <span class="Pages"/> (<span class="Date">to appear</span>)<br/>
                <div class="Abstract"/>
              </dd>
            </dl>
          </div>
        </xsl:if>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
