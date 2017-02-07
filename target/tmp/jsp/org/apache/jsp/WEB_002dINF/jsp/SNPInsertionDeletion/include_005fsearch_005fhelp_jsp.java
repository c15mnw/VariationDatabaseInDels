package org.apache.jsp.WEB_002dINF.jsp.SNPInsertionDeletion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class include_005fsearch_005fhelp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_spring_message_code_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_spring_message_code_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_spring_message_code_nobody.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <h2>");
      if (_jspx_meth_spring_message_0(_jspx_page_context))
        return;
      out.write("</h2>\n");
      out.write("    <br />\n");
      out.write("    <br />\n");
      out.write("    <p>The NARF variation database contains Insertion Deletion (InDel) information from 4 lines.<p>\n");
      out.write("    <p>This information was attained from a large resequencing project described in <strong><a href=\"http://dnaresearch.oxfordjournals.org/content/early/2015/04/28/dnares.dsv005.full\" style=\"color:#000000;\" target=\"_blank\">&quot;Functional classification of 15 million SNPs detected from diverse chicken populations&quot;</a></strong>.</p> \n");
      out.write("    <p>This database was designed to make this data easily accessible for researchers and to help with experimental designs pertaining to the NARF bred chicken lines.</p>      \n");
      out.write("    <br />\n");
      out.write("    <ul>\n");
      out.write("    <li><strong><a href=\"http://dnaresearch.oxfordjournals.org/content/early/2015/04/28/dnares.dsv005.full\" style=\"color:#000000;\" target=\"_blank\">&quot;Functional classification of 15 million SNPs detected from diverse chicken populations&quot;</a></strong>,<br/>\n");
      out.write("      AA Gheyas, C Boschiero, L Eory, H Ralph, R Kuo, JA Woolliams and DW Burt, <br />\n");
      out.write("    <strong>DNA Research</strong> <em>Vol.22</em>, <em>No.3</em>, <em>pp.205--217</em>, 2015.</li>\n");
      out.write("    <li><strong><a href=\"http://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-015-1711-1\" style=\"color:#000000;\" target=\"_blank\">&quot;Detection and characterization of novel short insertion and deletion polymorphisms from chicken genome&quot;</a></strong>,<br/>\n");
      out.write("      C Boschiero, AA Gheyas, HK Ralph, L Eory, B Paton, R Kuo, J Fulton, R Preisinger, P Kaiser and DW Burt,<br />\n");
      out.write("    <strong>BMC Genomics</strong> <em>Vol.16</em>, <em>No.1</em>, <em>pp.1--17</em>, 2015.</li>\n");
      out.write("    </ul>\n");
      out.write("\n");
      out.write("    <hr>\n");
      out.write("\n");
      out.write("    <h2>The Search Page</h2>\n");
      out.write("    <br />\n");
      out.write("    <p>The search page allows researchers to find InDels between two lines within specific genomic locations.</p> \n");
      out.write("    <p>You can define the genomic region by entering coordinates or entering gene names.</p>\n");
      out.write("    <p>All searches are based on comparing two lines so you must choose a reference line and a comparison line. Results will be given for genomic loci where the two lines have differing alleles.</p>\n");
      out.write("    <br />\n");
      out.write("      \n");
      out.write("    <hr>\n");
      out.write("\n");
      out.write("    <a id=\"searchEnsemblGeneName\"></a>\n");
      out.write("    <h4>SEARCH By Gene Name WITH Upstream AND Downstream Ranges</h4>\n");
      out.write("    <br />\n");
      out.write("    <p>To search for SNP’s within an Ensembl predicted gene use the “A Gene Name” search on the left side.</p>\n");
      out.write("    <p>Enter the Ensembl ID for your gene of interest. You can also choose to extend the region to include upstream and/or downstream regions of the gene.</p>  \n");
      out.write("    <p>If no upstream or downstream region is selected then the default is 0 for both.</p>\n");
      out.write("    <br />\n");
      out.write("    <p>The <em>Additional Upstream Range</em> must be a <strong>NUMBER</strong>; and is <strong>OPTIONAL</strong>.</p>\n");
      out.write("    <p>The <em>Additional Downstream Range</em> must be a <strong>NUMBER</strong>; and is <strong>OPTIONAL</strong>.</p>\n");
      out.write("    <p>The <em>Additional Upstream Range</em> <strong>AND</strong> <em>Additional Downstream Range</em> must <strong>NOT BE GREATER THAN</strong> <strong>10,000 Base Pairs each</strong>.</p>\n");
      out.write("    <p>If a <em>Chromosome</em> with <em>Start (LOW) Co-ordinate</em> and <em>End (HIGH) Co-ordinate</em> is not supplied, then an <em>Ensembl Gene Name</em> <strong>MUST BE SUPPLIED</strong>.</p>\n");
      out.write("    <br />\n");
      out.write("\n");
      out.write("    <hr>\n");
      out.write("\n");
      out.write("    <a id=\"searchCoordindates\"></a>\n");
      out.write("    <h4>SEARCH By Chromosome Id WITH Genomic Location</h4>\n");
      out.write("    <br />\n");
      out.write("    <p>To search for SNP’s with a specified genomic coordinates use the &quot;A Chromosome Id WITH Genomic Location&quot; fields in the middle.</p> \n");
      out.write("    <p>Select a chromosome from the drop down list and enter a start and end coordinate. The start coordinate must be a lower number than the end coordinate.</p>\n");
      out.write("    <p>If an <em>Ensembl Gene Name</em> is not supplied, then a <em>Chromosome</em> with <em>Start (LOW) Co-ordinate</em> and <em>End (HIGH) Co-ordinate</em> <strong>MUST BE SUPPLIED</strong>.</p>\n");
      out.write("    <br />\n");
      out.write("    <p>There are <strong>33</strong> Chromosomes to choose from:<br /><strong>1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 32, LGE22C19W28_E50C23, LGE64, W</strong> and <strong>Z</strong>.</p>\n");
      out.write("    <p>The <em>Start (LOW) Co-ordinate</em> must be a <strong>NUMBER</strong>, and <strong>MUST BE LOWER</strong> than the <em>End Co-ordinate</em>.</p>\n");
      out.write("    <p>The <em>End (HIGH) Co-ordinate</em> must be a <strong>NUMBER</strong>, and <strong>MUST BE HIGHER</strong> than the <em>Start Co-ordinate</em>.</p>\n");
      out.write("    <p>The Co-ordinate Range, between the supplied Start and End Co-ordinates, <strong>MUST NOT BE GREATER THAN 1,000,000 Base Pairs</strong>.</p>\n");
      out.write("    <br />\n");
      out.write("\n");
      out.write("    <hr>\n");
      out.write("\n");
      out.write("    <h4>Mandatory Search Fields</h4>\n");
      out.write("    <br />\n");
      out.write("\n");
      out.write("    <a id=\"referenceAllele\"></a>\n");
      out.write("    <h5>Reference Allele</h5>\n");
      out.write("    <br />\n");
      out.write("    <p>The reference strain is the first Chicken strain that you want to include in your InDel comparison search.</p> \n");
      out.write("    <p>The Alleles from this strain will be labelled as the reference in the output.</p>\n");
      out.write("    <br />\n");
      out.write("    <p>There are <strong>4</strong> Strains to choose from as <em>Reference Alleles</em>:<br /> <strong>Inbred Line W, Partial Inbred Line N, Inbred Line 15I</strong> and <strong>Partial Inbred Line 0</strong>.</p>\n");
      out.write("    <p>The Strain selected for the <em>Reference Alleles</em> <strong>MUST NOT BE EQUAL TO</strong> the Strain selected for the <em>Alternative Allele</em>; and is <strong>MANDATORY</strong>.</p>\n");
      out.write("    <br />\n");
      out.write("\n");
      out.write("    <a id=\"alternativeAllele\"></a>\n");
      out.write("    <h5>Alternative Allele</h5>\n");
      out.write("    <p>There are <strong>4</strong> Strains to choose from as <em>Alternative Alleles</em>:<br /> <strong>Inbred Line W, Partial Inbred Line N, Inbred Line 15I</strong> and <strong>Partial Inbred Line 0</strong>.</p>\n");
      out.write("    <br />\n");
      out.write("    <p>The alternative strain is the second Chicken strain that you want to include in your InDel comparison search.</p> \n");
      out.write("    <p>The allele from this strain will be labelled as the alternative allele in the output.</p>      \n");
      out.write("    <br />\n");
      out.write("    <p>The Strain selected for the <em>Alternative Alleles</em> <strong>MUST NOT BE EQUAL TO</strong> the Strain selected for the <em>Reference Allele</em>; and is <strong>MANDATORY</strong>.</p>\n");
      out.write("    <br />\n");
      out.write("\n");
      out.write("    <hr>\n");
      out.write("        \n");
      out.write("    <a id=\"searchUploadFile\"></a>\n");
      out.write("    <h4>SEARCH By Uploading a File of multiple Search Requests</h4>\n");
      out.write("    <br />\n");
      out.write("    <p>It is possible to submit a text file of multiple Search requests.</p>\n");
      out.write("    <p>Each Search request <strong>MUST</strong> consist of <strong>5 TAB Separated</strong> text Strings, in the following order.</p>  \n");
      out.write("    <br />\n");
      out.write("    <p><strong>1</strong>. <em>Chromosome</em><br />[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 32, LGE22C19W28_E50C23, LGE64, W or Z ]</p>\n");
      out.write("    <p><strong>2</strong>. <em>Start (LOW) Co-ordinate</em><br />[ A Number ]</p>\n");
      out.write("    <p><strong>3</strong>. <em>End (HIGH) Co-ordinate</em><br />[ A Number ].</p>\n");
      out.write("    <p><strong>4</strong>. <em>Reference Allele</em><br />[ REFERENCE, 7, P, W, N, 15I, ZERO, 6 or C ]</p>\n");
      out.write("    <p><strong>5</strong>. <em>Alternative Allele</em><br />[ REFERENCE, 7, P, W, N, 15I, ZERO, 6 or C ]</p>\n");
      out.write("  \n");
      out.write("    <br />\n");
      out.write("    <p><em>NOTA BENE:</em> <strong>ANY</strong> invalid Search request will invalidate <strong>ALL</strong> requests in the uploaded file, and <strong>NO</strong> search will be performed.</p>\n");
      out.write("\n");
      out.write("    <hr>\n");
      out.write("        \n");
      out.write("    <h5>Contact Us</h5>\n");
      out.write("    <a href=\"mailto:narf@roslin.ed.ac.uk\" class=\"red\">narf@roslin.ed.ac.uk</a>\n");
      out.write("\n");
      out.write("    ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_spring_message_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  spring:message
    org.springframework.web.servlet.tags.MessageTag _jspx_th_spring_message_0 = (org.springframework.web.servlet.tags.MessageTag) _jspx_tagPool_spring_message_code_nobody.get(org.springframework.web.servlet.tags.MessageTag.class);
    _jspx_th_spring_message_0.setPageContext(_jspx_page_context);
    _jspx_th_spring_message_0.setParent(null);
    _jspx_th_spring_message_0.setCode("spring.data.jpa.variation.search.about");
    int[] _jspx_push_body_count_spring_message_0 = new int[] { 0 };
    try {
      int _jspx_eval_spring_message_0 = _jspx_th_spring_message_0.doStartTag();
      if (_jspx_th_spring_message_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_spring_message_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_spring_message_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_spring_message_0.doFinally();
      _jspx_tagPool_spring_message_code_nobody.reuse(_jspx_th_spring_message_0);
    }
    return false;
  }
}
