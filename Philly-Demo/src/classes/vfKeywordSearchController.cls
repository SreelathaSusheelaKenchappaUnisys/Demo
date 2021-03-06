/* 
not used
*/
public with sharing class vfKeywordSearchController {

    public vfKeywordSearchController(ApexPages.StandardController controller) {

    }
    //Page Size
    private Static Final Integer PAGE_NUMBER = 10;
    //Search String used in ArticleList tag
    public String searchstring { get; set; }
    public list<KnowledgeArticleVersion> articlesList {get;set;}
    public string hiddenInput{get;set;}
    //Keeps track of current page & max size of article list
    Integer currentPage = 1;
    Integer maxSize = 1;

    public vfKeywordSearchController() {
        String qryString = 'SELECT Id, title, UrlName, LastPublishedDate,LastModifiedById FROM KnowledgeArticleVersion WHERE (PublishStatus =\'Online\' and Language = \'en_US\') ';
        List<KnowledgeArticleVersion> articleList= Database.query(qryString);
        maxSize = articleList.size() ;

    }
    // Returns whether we need to see previous button or not
    public boolean getPrevRequired() {
        return currentPage > 1;
    }
    // Returns whether we need to see next button or not
    public boolean getNextRequired() {
        return currentPage * PAGE_NUMBER < maxSize;
    }
    //Returns current page number
    public Decimal getCurrentPageNumber() {
        return this.currentPage;
    }
    //action for next click
    public PageReference next() {
        if(maxSize > this.currentPage * PAGE_NUMBER) {
            this.currentPage = this.currentPage + 1;
        }
        return null;
    }
    //action for previous click
    public PageReference previous() {
        this.currentPage = this.currentPage - 1;
        return null;
    }
}