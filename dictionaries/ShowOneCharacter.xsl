<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="dict" select="''"/>
  <xsl:param name="lang1" select="''"/>
  <xsl:param name="lang2" select="''"/>
  <xsl:param name="langn" select="''"/>
  <xsl:param name="char" select="''"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <!-- Tab title -->
          <xsl:value-of select="//Lexicon/@id"/>
        </title>
        <link href="../styles.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
          a:link{
              text-decoration:none;
              color:#630;
          }
          a:visited{
              text-decoration:none;
              color:#630;
          }
          a:hover{
              text-decoration:underline;
          }
          a:active{
              text-decoration:none;
          }</style>
      </head>
      <body>
        <!-- Create table -->
        <xsl:element name="table">
          <xsl:attribute name="width">100%</xsl:attribute>
          <xsl:attribute name="border">0</xsl:attribute>
          <xsl:attribute name="align">left</xsl:attribute>
          <tbody>
            <!-- Name of columns -->
            <xsl:element name="tr">
              <xsl:element name="td">
                <xsl:attribute name="width">15%</xsl:attribute>
                <b>
                  <xsl:text>Index</xsl:text>
                </b>
              </xsl:element>
              <xsl:element name="td">
                <xsl:attribute name="width">85%</xsl:attribute>
                <b>
                  <xsl:value-of select="$char"/>
                </b>
              </xsl:element>
            </xsl:element>
            <!-- Display index -->
            <xsl:element name="td">
              <xsl:attribute name="width">15%</xsl:attribute>
              <xsl:attribute name="valign">top</xsl:attribute>
              <xsl:call-template name="index"/>

            </xsl:element>
            <!-- Create list -->
            <xsl:element name="td">
              <xsl:attribute name="width">85%</xsl:attribute>
              <xsl:apply-templates select="//Lexicon/LexicalEntry"/>

            </xsl:element>
          </tbody>
        </xsl:element>
      </body>
    </html>
  </xsl:template>
  <xsl:template name="index">
    <xsl:for-each select="//Lexicon/LexicalEntry">
      <xsl:if test="starts-with(./Lemma/feat[@att='lexeme']//@val, $char)">
        <!-- Insert link -->
        <xsl:element name="a">
          <xsl:attribute name="href">
            <xsl:text>#</xsl:text>
            <xsl:value-of select="./@id"/>
          </xsl:attribute>
          <xsl:attribute name="style">
            <xsl:text>text-decoration:none;</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="class">lexeme</xsl:attribute>
          <xsl:call-template name="get">
            <xsl:with-param name="value" select="./Lemma/feat[@att='lexeme']//@val"/>
          </xsl:call-template>
          <br/>
        </xsl:element>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="//Lexicon/LexicalEntry">
    <xsl:if test="starts-with(./Lemma/feat[@att='lexeme']//@val, $char)">
      <dl>
        <dt>
          <span class="lexeme">
            <!-- Create an anchor -->
            <xsl:element name="a">
              <xsl:attribute name="name">
                <xsl:value-of select="./@id"/>
              </xsl:attribute>
            </xsl:element>
            <!-- Display lexeme -->
            <xsl:call-template name="get">
              <xsl:with-param name="value" select="./Lemma/feat[@att='lexeme']//@val"/>
            </xsl:call-template>
            <xsl:text>	</xsl:text>
          </span>
          <!-- Display citation form (khaling) -->
          <xsl:if test="$dict='khaling'">
            <xsl:text>Infinitive: </xsl:text>
            <span class="national">
              <xsl:value-of
                select="./Lemma/FormRepresentation/feat[@att='scriptName' and @val='devanagari']//ancestor::FormRepresentation/feat[@att='citationForm']//@val"
              />
            </span>
            <xsl:text>	</xsl:text>
            <span class="vernacular">
              <xsl:value-of
                select="./Lemma/FormRepresentation/feat[@att='scriptName' and @val='ipa']//ancestor::FormRepresentation/feat[@att='citationForm']//@val"/>
              <xsl:text>	</xsl:text>
            </span>
          </xsl:if>
          <!-- Listen audio -->
          <xsl:for-each select="./Lemma/FormRepresentation/Audio">
            <xsl:call-template name="play_audio">
              <xsl:with-param name="sound_url"
                select="concat($dict, '/data/audio/wav/', ./feat[@att='fileName']//@val)"/>
              <xsl:with-param name="file_format" select="./feat[@att='audioFileFormat']//@val"/>
            </xsl:call-template>
            <xsl:text>	</xsl:text>
          </xsl:for-each>
          <!-- Display part of speech or '-' if None -->
          <span class="part_of_speech">
            <xsl:value-of select="./feat[@att='partOfSpeech']//@val"/>
            <xsl:if test="not(./feat[@att='partOfSpeech']//@val)">
              <xsl:text>-</xsl:text>
            </xsl:if>
          </span>
          <xsl:text>	</xsl:text>
          <!-- Tone -->
          <xsl:if test="./Lemma/FormRepresentation/feat[@att='tone']//@val">
            <xsl:if test="($lang1='fra' or $lang2='fra') and $lang1!='eng' and $lang2!='eng'">
              <xsl:text>Ton : </xsl:text>
            </xsl:if>
            <xsl:if test="$lang1='eng' or $lang2='eng'">
              <xsl:text>Tone: </xsl:text>
            </xsl:if>
            <xsl:value-of select="./Lemma/FormRepresentation/feat[@att='tone']//@val"/>
            <xsl:text>. </xsl:text>
          </xsl:if>
          <!-- Display gloss in selected language(s) and in national language -->
          <span class="$lang1">
            <xsl:if
              test="./Sense/Definition/feat[@att='language' and @val=$lang1]//ancestor::Definition/feat[@att='gloss']//@val">
              <xsl:call-template name="get">
                <xsl:with-param name="value"
                  select="./Sense/Definition/feat[@att='language' and @val=$lang1]//ancestor::Definition/feat[@att='gloss']//@val"
                />
              </xsl:call-template>
              <xsl:text>. </xsl:text>
            </xsl:if>
          </span>
          <span class="$lang2">
            <xsl:if
              test="./Sense/Definition/feat[@att='language' and @val=$lang2]//ancestor::Definition/feat[@att='gloss']//@val">
              <xsl:call-template name="get">
                <xsl:with-param name="value"
                  select="./Sense/Definition/feat[@att='language' and @val=$lang2]//ancestor::Definition/feat[@att='gloss']//@val"
                />
              </xsl:call-template>
              <xsl:text>. </xsl:text>
            </xsl:if>
          </span>
          <span class="national">
            <xsl:if
              test="./Sense/Definition/feat[@att='language' and @val=$langn]//ancestor::Definition/feat[@att='gloss']//@val">
              <xsl:call-template name="get">
                <xsl:with-param name="value"
                  select="./Sense/Definition/feat[@att='language' and @val=$langn]//ancestor::Definition/feat[@att='gloss']//@val"
                />
              </xsl:call-template>
              <xsl:text>. </xsl:text>
            </xsl:if>
          </span>
          <!-- Semantic domain -->
          <xsl:if
            test="./Sense/SubjectField/feat[@att='language' and @val=$lang1]//ancestor::SubjectField/feat[@att='semanticDomain']//@val">
            <i>
              <xsl:value-of
                select="./Sense/SubjectField/feat[@att='language' and @val=$lang1]//ancestor::SubjectField/feat[@att='semanticDomain']//@val"/>
              <xsl:text>. </xsl:text>
            </i>
          </xsl:if>
          <xsl:if
            test="./Sense/SubjectField/feat[@att='language' and @val=$lang2]//ancestor::SubjectField/feat[@att='semanticDomain']//@val">
            <i>
              <xsl:value-of
                select="./Sense/SubjectField/feat[@att='language' and @val=$lang2]//ancestor::SubjectField/feat[@att='semanticDomain']//@val"/>
              <xsl:text>. </xsl:text>
            </i>
          </xsl:if>
          <!-- Cross references -->
          <xsl:for-each select="./RelatedForm">
            <!-- confer -->
            <xsl:if test="./feat[@att='semanticRelation' and @val='simple link']">
              <xsl:if test="($lang1='fra' or $lang2='fra') and $lang1!='eng' and $lang2!='eng'">
                <xsl:text>Voir : </xsl:text>
              </xsl:if>
              <xsl:if test="$lang1='eng' or $lang2='eng'">
                <xsl:text>See: </xsl:text>
              </xsl:if>
            </xsl:if>
            <!-- synonym -->
            <xsl:if test="./feat[@att='semanticRelation' and @val='synonym']">
              <xsl:if test="($lang1='fra' or $lang2='fra') and $lang1!='eng' and $lang2!='eng'">
                <xsl:text>Syn : </xsl:text>
              </xsl:if>
              <xsl:if test="$lang1='eng' or $lang2='eng'">
                <xsl:text>Syn: </xsl:text>
              </xsl:if>
            </xsl:if>
            <!-- antonym -->
            <xsl:if test="./feat[@att='semanticRelation' and @val='antonym']">
              <xsl:if test="($lang1='fra' or $lang2='fra') and $lang1!='eng' and $lang2!='eng'">
                <xsl:text>Ant : </xsl:text>
              </xsl:if>
              <xsl:if test="$lang1='eng' or $lang2='eng'">
                <xsl:text>Ant: </xsl:text>
              </xsl:if>
            </xsl:if>
            <!-- homonym -->
            <xsl:if test="./feat[@att='semanticRelation' and @val='homonym']">
              <xsl:if test="($lang1='fra' or $lang2='fra') and $lang1!='eng' and $lang2!='eng'">
                <xsl:text>Voir : </xsl:text>
              </xsl:if>
              <xsl:if test="$lang1='eng' or $lang2='eng'">
                <xsl:text>See: </xsl:text>
              </xsl:if>
            </xsl:if>
            <!-- Insert link -->
            <xsl:choose>
              <xsl:when
                test="./feat[@att='semanticRelation' and (@val='simple link' or @val='synonym' or @val='antonym')]">
                <xsl:if test="./a//@href">
                  <xsl:variable name="targets" select="./a[@href][1]"/>
                  <!-- Local link -->
                  <xsl:if test="starts-with($targets, $char)">
                    <xsl:element name="a">
                      <xsl:attribute name="href">
                        <xsl:text>#</xsl:text>
                        <xsl:value-of
                          select="substring(./a//@href, 1, string-length(./a//@href) - 1)"/>
                      </xsl:attribute>
                      <xsl:attribute name="class">vernacular</xsl:attribute>
                      <xsl:value-of select="$targets"/>
                    </xsl:element>
                  </xsl:if>
                  <!-- Hyperlink -->
                  <xsl:if test="not(starts-with($targets, $char))">
                    <xsl:element name="a">
                      <xsl:attribute name="href">
                        <xsl-text>ViewOneCharacter.php?dict=</xsl-text>
                        <xsl:value-of select="$dict"/>
                        <xsl:text>&amp;lang1=</xsl:text>
                        <xsl:value-of select="$lang1"/>
                        <xsl:text>&amp;lang2=</xsl:text>
                        <xsl:value-of select="$lang2"/>
                        <xsl:text>&amp;langn=</xsl:text>
                        <xsl:value-of select="$langn"/>
                        <xsl:text>&amp;char=</xsl:text>
                        <xsl:value-of select="substring($targets, 1, 1)"/>
                        <xsl:text>#</xsl:text>
                        <xsl:value-of
                          select="substring(./a//@href, 1, string-length(./a//@href) - 1)"/>
                      </xsl:attribute>
                      <xsl:attribute name="class">vernacular</xsl:attribute>
                      <xsl:value-of select="$targets"/>
                    </xsl:element>
                  </xsl:if>
                </xsl:if>
                <xsl:text>	</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </dt>
        <!-- Apply another template to display examples -->
        <xsl:apply-templates select="./Sense/Context"/>
      </dl>
    </xsl:if>
  </xsl:template>
  <xsl:template name="play_audio">
    <xsl:param name="sound_url" select="''"/>
    <xsl:param name="file_format" select="''"/>
    <xsl:element name="a">
      <xsl:attribute name="href">
        <xsl-text>PlayAudio.php?sound_url=</xsl-text>
        <xsl:value-of select="$sound_url"/>
        <xsl-text>&amp;file_format=</xsl-text>
        <xsl:value-of select="$file_format"/>
      </xsl:attribute>
      <xsl:attribute name="title">Listen</xsl:attribute>
      <xsl:attribute name="target">popup</xsl:attribute>
      <xsl:attribute name="onClick"
        >window.open(this.href,'popup','width=350,height=35,scrollbars=yes,resizable=yes',1).focus();return
        false</xsl:attribute>
      <img height="14px" width="14px" src="../images/icones/sound1_bleu.jpg"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="//Lexicon/LexicalEntry/Sense/Context">
    <p/>
    <xsl:if test="$dict='japhug'">
      <dd class="vernacular">
        <xsl:call-template name="get">
          <xsl:with-param name="value"
            select="./TextRepresentation/feat[@att='language' and @val='jya']//ancestor::TextRepresentation/feat[@att='writtenForm']//@val"
          />
        </xsl:call-template>
      </dd>
    </xsl:if>
    <xsl:if test="$dict='khaling'">
      <!-- IPA -->
      <dd class="vernacular">
        <xsl:call-template name="get">
          <xsl:with-param name="value"
            select="./TextRepresentation/feat[@att='language' and @val='klr']//ancestor::TextRepresentation/feat[@att='scriptName' and @val='ipa']//ancestor::TextRepresentation/feat[@att='writtenForm']//@val"
          />
        </xsl:call-template>
      </dd>
      <!-- Devanagari -->
      <dd class="national">
        <xsl:call-template name="get">
          <xsl:with-param name="value"
            select="./TextRepresentation/feat[@att='language' and @val='klr']//ancestor::TextRepresentation/feat[@att='scriptName' and @val='devanagari']//ancestor::TextRepresentation/feat[@att='writtenForm']//@val"
          />
        </xsl:call-template>
      </dd>
    </xsl:if>
    <xsl:if test="$dict='na'">
      <dd class="vernacular">
        <xsl:call-template name="get">
          <xsl:with-param name="value"
            select="./TextRepresentation/feat[@att='language' and @val='nru']//ancestor::TextRepresentation/feat[@att='writtenForm']//@val"
          />
        </xsl:call-template>
      </dd>
    </xsl:if>
    <dd class="$lang1">
      <xsl:call-template name="get">
        <xsl:with-param name="value"
          select="./TextRepresentation/feat[@att='language' and @val=$lang1]//ancestor::TextRepresentation/feat[@att='writtenForm']//@val"
        />
      </xsl:call-template>
    </dd>
    <dd class="$lang2">
      <xsl:call-template name="get">
        <xsl:with-param name="value"
          select="./TextRepresentation/feat[@att='language' and @val=$lang2]//ancestor::TextRepresentation/feat[@att='writtenForm']//@val"
        />
      </xsl:call-template>
    </dd>
    <dd class="national">
      <xsl:call-template name="get">
        <xsl:with-param name="value"
          select="./TextRepresentation/feat[@att='language' and @val=$langn]//ancestor::TextRepresentation/feat[@att='writtenForm']//@val"
        />
      </xsl:call-template>
    </dd>
  </xsl:template>
  <xsl:template name="get">
    <xsl:param name="value"/>
    <xsl:choose>
      <!-- Check if value has already been formatted in XML -->
      <xsl:when test="$value/../span//@class">
        <xsl:copy-of select="$value/../node()"/>
      </xsl:when>
      <xsl:when test="$value/../sub">
        <xsl:copy-of select="$value/../node()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$value"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
