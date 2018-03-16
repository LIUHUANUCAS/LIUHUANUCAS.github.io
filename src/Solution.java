package backtrack;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

public class Solution {
	public static HashMap<NodeValue,Boolean> visitedMap = new HashMap<NodeValue,Boolean>();
	
	public static void main(String[] args) {
        
    }

	public static int numIslands(char[][] grid) {
		
		// 每一个节点都需要遍历,其实，已经遍历过的节点，会在visitedMap当中标志，不会添加相邻节点到队列当中
		int area = 0;
		int count = 0;
		for(int x =0; x < grid.length;++x) {
			for(int y = 0; y < grid[0].length;++y) {
				if(visitedMap.containsKey(new NodeValue(x,y)) == false) {
					BFS(grid,x,y);
					count ++;// 表示找到了一个连通分量
					/**
					if(area < tarea) {
						area = tarea;
					}
					**/
				}
			}
		}
		
    	return count;
	}
	
	/**
	 * grid 可以认为是一个图，startNodex,startNodey 表示开始遍历的节点
	 * */
	public static int BFS(char[][] grid,int startx,int starty) { 
		
		int area = 1; //当前只有一个节点
		Queue<NodeValue> Q = new LinkedList<NodeValue>();
		
		NodeValue e = new NodeValue(starty, starty);
		Q.add(e);
		visitedMap.put(e, true);
		
		while(! Q.isEmpty()) {
			NodeValue q = Q.poll();
			ArrayList<NodeValue> adjlist = getAdjList(grid,q);
			
			for(int i = 0 ;i < adjlist.size(); ++i) {
				
				if(visitedMap.containsKey(adjlist.get(i)) == false) {
					Q.add(adjlist.get(i));
					visitedMap.put(adjlist.get(i), true);
					area += 1;// 说明这个是可以到达的和startx,starty 是相邻的
				}
			}
		}
		
		return area;
	}
	
	/**寻找其相邻节点的函数*/
	public static ArrayList<NodeValue> getAdjList(char[][] grid,NodeValue e) {
		ArrayList<NodeValue> adjlist = new ArrayList<NodeValue>();
		int xlen = grid.length;
		
		int ylen = grid[0].length;
		
		if(e.x - 1 >=0 ) { // 上面
			if (grid[e.x -1 ][e.y] == '1') {
				adjlist.add(new NodeValue(e.x-1,e.y));
			}
		}
		
		if(e.y - 1 >=0 ) { //左面
			if (grid[e.x ][e.y - 1 ] == '1') {
				adjlist.add(new NodeValue(e.x,e.y - 1 ));
			}
		}
		
		if(e.x + 1 < xlen ) { // 下面
			if (grid[e.x + 1 ][e.y] == '1') {
				adjlist.add(new NodeValue(e.x + 1,e.y));
			}
		}
		
		if(e.y + 1 < ylen ) { // 右面
			if (grid[e.x ][e.y + 1] == '1') {
				adjlist.add(new NodeValue(e.x,e.y + 1));
			}
		}
		
		return adjlist;
	}
	
	
}

class NodeValue{
	public int x, y;
	public NodeValue(int x,int y){
		this.x = x;
		this.y = y;
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		
		if(this == obj)
			return true;
		if(obj == null)
			return false;
		NodeValue node = (NodeValue)obj;
		return this.x == node.x && this.y == node.y;
	}
}

/***
 * A----B    D    E
 * |    |    |    |
 * F----G    H    I
 *           |    |
 * J    K    L    M
 * |         |
 * N    O----P----Q
 * 
 * (x-1,y-1)---(x-1,y)----(x,y-1)
 * (x , y-1)---(x , y)----(x,y+1)
 * (x+1,y-1)---(x+1,y)----(x+1,y+1)
 * 
 *  11110
	11010
	11000
	00000
	answer:1
 * 
 *  11000
	11000
	00100
	00011
 * answer:3
 */


