<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <h2><spring:message code="spring.data.jpa.variation.search_results.about"/></h2>
      <br /><br />
      
      <p>The NARF variation database contains Insertion Deletion (InDel) information from 4 lines.<p>
      <p>This information was attained from a large resequencing project described in <strong><a href="http://dnaresearch.oxfordjournals.org/content/early/2015/04/28/dnares.dsv005.full" style="color:#000000;" target="_blank">&quot;Functional classification of 15 million SNPs detected from diverse chicken populations&quot;</a></strong>.</p> 
      <p>This database was designed to make this data easily accessible for researchers and to help with experimental designs pertaining to the NARF bred chicken lines.</p>      
      <br />

      <ul>
        <li><strong><a href="http://dnaresearch.oxfordjournals.org/content/early/2015/04/28/dnares.dsv005.full" style="color:#000000;" target="_blank">&quot;Functional classification of 15 million SNPs detected from diverse chicken populations&quot;</a></strong>,<br/>
      AA Gheyas, C Boschiero, L Eory, H Ralph, R Kuo, JA Woolliams and DW Burt, <br />
      <strong>DNA Research</strong> <em>Vol.22</em>, <em>No.3</em>, <em>pp.205--217</em>, 2015.</li>
        <li><strong><a href="http://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-015-1711-1" style="color:#000000;" target="_blank">&quot;Detection and characterization of novel short insertion and deletion polymorphisms from chicken genome&quot;</a></strong>,<br/>
      C Boschiero, AA Gheyas, HK Ralph, L Eory, B Paton, R Kuo, J Fulton, R Preisinger, P Kaiser and DW Burt,<br />
      <strong>BMC Genomics</strong> <em>Vol.16</em>, <em>No.1</em>, <em>pp.1--17</em>, 2015.</li>
      </ul>

      <hr>

<h4>The Results Columns</h4>
      <br />

<a id="chromosomeIdentifier"></a>
<h5>1. "ChrId." - Chromosome Identifier</h5>
      <br />
      <p>There are <strong>33</strong> Chromosomes to choose from:<br /><strong>1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 32, LGE22C19W28_E50C23, LGE64, W</strong> and <strong>Z</strong>.</p>
      <br />

<a id="positionStart"></a>
<h5>2. "Start Pos." - Start Co-ordinate</h5>
      <br />
      <p>The <em>Start (LOW) Co-ordinate</em> is a number lower than the <em>End Co-ordinate</em>.</p>
      <br />

<a id="positionEnd"></a>
<h5>2. "End Pos." - End Co-ordinate</h5>
      <br />
      <p>The <em>End (HIGH) Co-ordinate</em> is a number higher than the <em>Start Co-ordinate</em>.</p>
      <br />

<a id="referenceAllele"></a>
<h5>3. "Ref." - Reference Allele</h5>
      <br />
      <p>The Reference InDel.</p>
      <br />

<a id="alternativeAllele"></a>
<h5>4. "Alt." - Alternative Allele</h5>
      <br />
      <p>The Alternative InDel.</p>
      <br />


<a id="strainX"></a>
<h5>9. "Breed X" - The InDel for the Given Breed</h5>
      <br />
      <p>The Reference or Alternative InDel for the given Breed.</p>
      <br />

      <hr>
        
      <h5>Contact Us</h5>
        <a href="../mailto:narf@roslin.ed.ac.uk" class="red">narf@roslin.ed.ac.uk</a>

        