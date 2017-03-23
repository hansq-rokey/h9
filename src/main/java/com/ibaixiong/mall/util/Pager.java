package com.ibaixiong.mall.util;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.Page;

public class Pager<T> implements Serializable {
	private static final long serialVersionUID = 1L;
	private List<T> list; //对象记录结果集
	    private int total = 0; // 总记录数
	    private int pageSize = 20; // 每页显示记录数
	    private int pages = 1; // 总页数
	    private int pageNumber = 1; // 当前页
	    
	    private boolean isFirstPage=false;        //是否为第一页
	    private boolean isLastPage=false;         //是否为最后一页
	    private boolean hasPreviousPage=false;   //是否有前一页
	    private boolean hasNextPage=false;       //是否有下一页
	     
	    private int navigatePages=4; //导航页码数
	    private int[] navigatePageNumbers;  //所有导航页号
	    
	    private boolean hasBeforPoint=false;//是否有前面点
	    private boolean hasAfterPoint=false;//是否有后面点
	    private int start=0;
	    private int end=0;
	    
	    public Pager(int total, int pageNumber) {
	        init(total, pageNumber, pageSize);
	    }
	     
	    public Pager(List<T> list, int pageNumber, int pageSize) {
	    	if (list instanceof Page) {
	            Page<T> page = (Page<T>) list;
	            this.total = (int)page.getTotal();
	    	}
	        init(total, pageNumber, pageSize);
	    }
	    
	    public Pager(int total, int pageNumber, int pageSize) {
	        init(total, pageNumber, pageSize);
	    }
	    
	    private void init(int total, int pageNumber, int pageSize){
	        //设置基本参数
	        this.total=total;
	        this.pageSize=pageSize;
	        this.pages=(this.total-1)/this.pageSize+1;
	         
	        //根据输入可能错误的当前号码进行自动纠正
	        if(pageNumber<1){
	            this.pageNumber=1;
	        }else if(pageNumber>this.pages){
	            this.pageNumber=this.pages;
	        }else{
	            this.pageNumber=pageNumber;
	        }
	         
	        //基本参数设定之后进行导航页面的计算
	        calcNavigatePageNumbers();
	         
	        //以及页面边界的判定
	        judgePageBoudary();
	    }
	     
	    /**
	     * 计算导航页
	     */
	    private void calcNavigatePageNumbers(){
	        //当总页数小于或等于导航页码数时
	        if(pages<=navigatePages){
	            navigatePageNumbers=new int[pages];
	            for(int i=0;i<pages;i++){
	                navigatePageNumbers[i]=i+1;
	            }
	        }else{ //当总页数大于导航页码数时
	            navigatePageNumbers=new int[navigatePages];
	            int startNum=pageNumber+1-navigatePages/2;
	            int endNum=pageNumber+1+navigatePages/2;
	            start=startNum;
	            end=endNum;
	            if(startNum<1){
	                startNum=1;
	    	        hasAfterPoint=(pages-endNum)>0;
	                //(最前navigatePages页
	                for(int i=0;i<navigatePages;i++){
	                    navigatePageNumbers[i]=startNum++;
	                }
	            }else if(endNum>pages){
	                endNum=pages;
	                hasBeforPoint=(startNum-1)>1;
	                //最后navigatePages页
	                for(int i=navigatePages-1;i>=0;i--){
	                    navigatePageNumbers[i]=endNum--;
	                }
	            }else{
	            	hasBeforPoint=(startNum-1)>1;
	            	hasAfterPoint=(pages-endNum+1)>0;
	                //所有中间页
	                for(int i=0;i<navigatePages;i++){
	                    navigatePageNumbers[i]=startNum++;
	                }
	            }
	        }
	    }
	 
	    /**
	     * 判定页面边界
	     */
	    private void judgePageBoudary(){
	        isFirstPage = pageNumber == 1;
	        isLastPage = pageNumber == pages && pageNumber!=1;
	        hasPreviousPage = pageNumber > 1;
	        hasNextPage = pageNumber < pages;
	    }
	     
	     
	    public void setList(List<T> list) {
	        this.list = list;
	    }
	 
	    /**
	     * 得到当前页的内容
	     * @return {List}
	     */
	    public List<T> getList() {
	        return list;
	    }
	 
	    /**
	     * 得到记录总数
	     * @return {int}
	     */
	    public int getTotal() {
	        return total;
	    }
	 
	    /**
	     * 得到每页显示多少条记录
	     * @return {int}
	     */
	    public int getPageSize() {
	        return pageSize;
	    }
	 
	    /**
	     * 得到页面总数
	     * @return {int}
	     */
	    public int getPages() {
	        return pages;
	    }
	 
	    public boolean getIsHasPreviousPage() {
			return hasPreviousPage;
		}

		public boolean getIsHasNextPage() {
			return hasNextPage;
		}

		public int getNavigatePages() {
			return navigatePages;
		}

		/**
	     * 得到当前页号
	     * @return {int}
	     */
	    public int getPageNumber() {
	        return pageNumber;
	    }
	 
	 
	    public boolean getHasBeforPoint() {
			return hasBeforPoint;
		}

		public boolean getHasAfterPoint() {
			return hasAfterPoint;
		}

		/**
	     * 得到所有导航页号 
	     * @return {int[]}
	     */
	    public int[] getNavigatePageNumbers() {
	        return navigatePageNumbers;
	    }
	 
	    public boolean getIsFirstPage() {
	        return isFirstPage;
	    }
	 
	    public boolean getIsLastPage() {
	        return isLastPage;
	    }
	 
	    public boolean getHasPreviousPage() {
	        return hasPreviousPage;
	    }
	 
	    public boolean getHasNextPage() {
	        return hasNextPage;
	    }
	 
	    public int getStart() {
			return start;
		}

		public int getEnd() {
			return end;
		}

		public String toString(){
	        StringBuffer sb=new StringBuffer();
	        sb.append("[")
	            .append("total=").append(total)
	            .append(",pages=").append(pages)
	            .append(",pageNumber=").append(pageNumber)
	            .append(",pageSize=").append(pageSize)
	            .append(",isFirstPage=").append(isFirstPage)
	            .append(",isLastPage=").append(isLastPage)
	            .append(",hasPreviousPage=").append(hasPreviousPage)
	            .append(",hasNextPage=").append(hasNextPage)
	        .append(",navigatePageNumbers=");
	        int len=navigatePageNumbers.length;
	        if(len>0)sb.append(navigatePageNumbers[0]);
	        for(int i=1;i<len;i++){
	            sb.append(" "+navigatePageNumbers[i]);
	        }
	        //sb.append(",list.size="+list.size());
	        sb.append("]");
	        return sb.toString();
	    }
}
