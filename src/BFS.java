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
		/* ��ʼ�����ݽṹ
		 * ����Q
		 * �Ƿ�����ı�־hashmap
		 */
		
		Queue<Node> Q = new LinkedList<Node>();

		/** ��ʼ����־
		 */
		Q.add(S);
		
		while( !Q.isEmpty()) { // (0).���зǿ�
			Node q = Q.poll(); // (1).������
			visited(q); // (2).������Ǳ�������������Ҫͨ��������ʵ�ֵ�Ŀ��ĺ���
			
			
			ArrayList<Node> adjNodeList = G.getAdjectList(q); // ��ȡ���ڵĽڵ�
			for(int i = 0; i < adjNodeList.size() ; ++i) {
				/**û�б����ʹ����ŵ����е���*/
				if (visitedMap.containsKey(adjNodeList.get(i)) == false) { // û�б����ʹ�
					Q.add(adjNodeList.get(i)); //���뵽������
				}
			}//end for
		}// end while
	}
	
	public static void visited(Node s) {
		System.out.println(s); // ����ֻ�Ǽ򵥵Ĵ�ӡһ��
	}
	
	
	
	  public class TreeNode {
		      int val;
		      TreeNode left;
		      TreeNode right;
		      TreeNode(int x) { val = x; }
	  }
	
}


