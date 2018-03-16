package backtrack;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

import javax.xml.soap.Node;

public class BackTrack {
	public static void main(String []args) {
		int n = 5;
		System.out.println("5! = " + factorial(n));
	}
	
	public static int factorial(int n) {
		/* (1).最为基本的情况，也就是说，这个问题已经不能再小了，我已经知道怎么解决了。所有的递归都需要有明确的返回，
		 * (2).只有在最基本的情况下返回，递归才不会无线循环下去，因为递归是调用自己的。
		 */
		if (n <= 0 ) 
			return 1;
		else {
			/* (1).一个规模小的问题，和当前的问题的关系是什么
			 * (2).这里阶乘的计算是 n*f(n-1)的关系
			 * (3).如果是求和，那么是 n + f(n-1)的关系
			 */
			return n * factorial(n-1);
		}
	}
	
	public static void BFS(Node S,Graph G) {
		/* 初始化数据结构
		 * 队列Q
		 * 是否遍历的标志hashmap
		 */
		
		Queue<Node> Q = new LinkedList<Node>();
		HashMap<Node,Boolean> visitedMap = new HashMap<Node,Boolean>();

		/** 初始化标志
		 */
		Q.add(S);
		visitedMap.put(S, true); // S 已经认为是在队列当中，说明已经要被访问了，所以这么标志
		
		while( !Q.isEmpty()) { // (0).队列非空
			Node q = Q.poll(); // (1).出队列
			visited(q); // (2).这个就是遍历函数，或者要通过遍历来实现的目标的函数
			
			/* (3).把它的相邻节点，有个求相邻节点的函数
			 * 且未遍历到的标志为遍历并放入队列Q
			 */
			
			ArrayList<Node> adjNodeList = G.getAdjectList(q); // 获取相邻的节点
			for(int i = 0; i < adjNodeList.size() ; ++i) {
				/**没有被访问过，放到队列当中*/
				if (visitedMap.containsKey(adjNodeList.get(i)) == false) { // 没有被访问过
					Q.add(adjNodeList.get(i)); //加入到队列中
					visitedMap.put(adjNodeList.get(i),true);// 表示已经访问了
				}
			}//end for
		}// end while
	}
	
	public static void visited(Node s) {
		System.out.println(s); // 这里只是简单的打印一下
	}
	
	
	
	class Node{
		
	}
	
	class Graph{
		int size() {
			return 0;
		}
		Node get(int i) {
			return new Node();
		}
		
		ArrayList<Node> getAdjectList(Node s){
			ArrayList<Node> res = new ArrayList<Node>();
			return res;
		}
	}
	
}


