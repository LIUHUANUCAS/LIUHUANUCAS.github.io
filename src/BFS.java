package backtrack;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

import javax.xml.soap.Node;

public class BFS {
	public static void main(String []args) {
		int n = 5;
	}
	
	
	public static void BFS(Node S,Graph G) {
		/* 初始化数据结构
		 * 队列Q
		 * 是否遍历的标志hashmap
		 */
		
		Queue<Node> Q = new LinkedList<Node>();

		/** 初始化标志
		 */
		Q.add(S);
		
		while( !Q.isEmpty()) { // (0).队列非空
			Node q = Q.poll(); // (1).出队列
			visited(q); // (2).这个就是遍历函数，或者要通过遍历来实现的目标的函数
			
			
			ArrayList<Node> adjNodeList = G.getAdjectList(q); // 获取相邻的节点
			for(int i = 0; i < adjNodeList.size() ; ++i) {
				/**没有被访问过，放到队列当中*/
				if (visitedMap.containsKey(adjNodeList.get(i)) == false) { // 没有被访问过
					Q.add(adjNodeList.get(i)); //加入到队列中
				}
			}//end for
		}// end while
	}
	
	public static void visited(Node s) {
		System.out.println(s); // 这里只是简单的打印一下
	}
	
	
	
	  public class TreeNode {
		      int val;
		      TreeNode left;
		      TreeNode right;
		      TreeNode(int x) { val = x; }
	  }
	
}


