// package backtrack;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

public class MergeLinkList {
	
	public static void main(String[] args) {
        
    }
	
	public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
	        ListNode head = new ListNode(0);
	        ListNode phead = head;
	        while(l1 != null && l2 != null) {
	        	if(l1.val < l2.val) {
	        		phead.next = l1;
	        		l1 = l1.next;
	        		phead = phead.next;
	        		phead.next = null;
	        	}else {
	        		phead.next = l2;
	        		l2 = l2.next;
	        		phead = phead.next;
	        		phead.next = null;
	        	}
	        }
	        
	        phead.next = l1 != null ? l1 : l2;
	        return head.next;
	}
	
}

/**
 * Definition for singly-linked list.
 *  
 */
class ListNode {
      int val;
      ListNode next;
      public ListNode(int x) { 
    	  val = x; 
      }
}

