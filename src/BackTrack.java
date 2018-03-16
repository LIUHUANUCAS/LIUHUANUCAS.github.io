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
		/* (1).��Ϊ�����������Ҳ����˵����������Ѿ�������С�ˣ����Ѿ�֪����ô����ˡ����еĵݹ鶼��Ҫ����ȷ�ķ��أ�
		 * (2).ֻ���������������·��أ��ݹ�Ų�������ѭ����ȥ����Ϊ�ݹ��ǵ����Լ��ġ�
		 */
		if (n <= 0 ) 
			return 1;
		else {
			/* (1).һ����ģС�����⣬�͵�ǰ������Ĺ�ϵ��ʲô
			 * (2).����׳˵ļ����� n*f(n-1)�Ĺ�ϵ
			 * (3).�������ͣ���ô�� n + f(n-1)�Ĺ�ϵ
			 */
			return n * factorial(n-1);
		}
	}
	
	public static void BFS(Node S,Graph G) {
		/* ��ʼ�����ݽṹ
		 * ����Q
		 * �Ƿ�����ı�־hashmap
		 */
		
		Queue<Node> Q = new LinkedList<Node>();
		HashMap<Node,Boolean> visitedMap = new HashMap<Node,Boolean>();

		/** ��ʼ����־
		 */
		Q.add(S);
		visitedMap.put(S, true); // S �Ѿ���Ϊ���ڶ��е��У�˵���Ѿ�Ҫ�������ˣ�������ô��־
		
		while( !Q.isEmpty()) { // (0).���зǿ�
			Node q = Q.poll(); // (1).������
			visited(q); // (2).������Ǳ�������������Ҫͨ��������ʵ�ֵ�Ŀ��ĺ���
			
			/* (3).���������ڽڵ㣬�и������ڽڵ�ĺ���
			 * ��δ�������ı�־Ϊ�������������Q
			 */
			
			ArrayList<Node> adjNodeList = G.getAdjectList(q); // ��ȡ���ڵĽڵ�
			for(int i = 0; i < adjNodeList.size() ; ++i) {
				/**û�б����ʹ����ŵ����е���*/
				if (visitedMap.containsKey(adjNodeList.get(i)) == false) { // û�б����ʹ�
					Q.add(adjNodeList.get(i)); //���뵽������
					visitedMap.put(adjNodeList.get(i),true);// ��ʾ�Ѿ�������
				}
			}//end for
		}// end while
	}
	
	public static void visited(Node s) {
		System.out.println(s); // ����ֻ�Ǽ򵥵Ĵ�ӡһ��
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


