import java.util.Comparator;
import java.util.PriorityQueue;

public class PriorityQueueTest {

	public static void main(String[] args) {
		Comparator<Node> comparator = new Comparator<Node>() {
			@Override
			public int compare(Node o1, Node o2) {
				return -o1.w + o2.w;
			}
		};
		PriorityQueue<Node> pqueue = new  PriorityQueue<Node>(comparator);
		pqueue.add(new Node(1,1));
		pqueue.add(new Node(2,-1));
		pqueue.add(new Node(5,6));
		pqueue.add(new Node(3,3));
		pqueue.add(new Node(4,-3));
		while(!pqueue.isEmpty()) {
			Node e = pqueue.poll();
			System.out.println(e);
		}
		
		IntQueue();
		NodeQueue2();
		
	}
	public static void NodeQueue2() {
		Comparator<Node2> comparator = new Comparator<Node2>() {
			@Override
			public int compare(Node2 o1, Node2 o2) {
				return -o1.w + o2.w;
			}
		};
		
		PriorityQueue<Node2> pqueue = new  PriorityQueue<Node2>(comparator);
		pqueue.add(new Node2(1,1));
		pqueue.add(new Node2(2,-1));
		pqueue.add(new Node2(5,6));
		pqueue.add(new Node2(3,3));
		pqueue.add(new Node2(4,-3));
		while(!pqueue.isEmpty()) {
			Node2 e = pqueue.poll();
			System.out.println(e);
		}
	}
	public static void NodeQueue() {
		PriorityQueue<Node> pqueue = new  PriorityQueue<Node>();
		pqueue.add(new Node(1,1));
		pqueue.add(new Node(2,-1));
		pqueue.add(new Node(5,6));
		pqueue.add(new Node(3,3));
		pqueue.add(new Node(4,-3));
		while(!pqueue.isEmpty()) {
			Node e = pqueue.poll();
			System.out.println(e);
		}
	}
	
	
	public static void IntQueue() {
		PriorityQueue<Integer> pqueue = new  PriorityQueue<Integer>();
		pqueue.add(0);
		pqueue.add(-1);
		pqueue.add(3);
		pqueue.add(-3);
		pqueue.add(5);
		while(!pqueue.isEmpty()) {
			int e = pqueue.poll();
			System.out.println(e);
		}
		
	}
	
	
}
class Node2{
	int id;
	int w;
	Node2(int id,int w){
		this.id = id;
		this.w = w;
	}
	
	@Override
	public String toString() {
		return "(" + id +"," + w +")";
	}
}
class Node extends Node2 implements Comparable<Node>{
	int id;
	int w;
	Node(int id,int w){
		super(id,w);
	}
	
	@Override
	public int compareTo(Node o) {
		return this.w - o.w ;
	}
}
