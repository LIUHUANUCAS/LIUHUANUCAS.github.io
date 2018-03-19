import java.util.Stack;


public class Tree {
	public static void preOrder(TreeNode root){
		/**子树为空时，停止遍历*/
		if(root == null)
			return ; 
		/**
		 * 1.先访问根节点
		 * 2.访问左子树
		 * 3.访问右子树
		 * */
		visited(root); // 访问的方法
		preOrder(root.left);  // 把左子树看成一棵树、调用遍历方法
		preOrder(root.right); // 把右子树看成一棵树、调用遍历方法
	}
	
	public static void preOrderStack(TreeNode root){
		if(root == null)
			return ;
		
		/**
		 * 1.先访问根节点
		 * 2.访问左子树
		 * 3.访问右子树
		 * */
		
		Stack<TreeNode> stack = new Stack<TreeNode>();
		stack.push(root);
		while(! stack.empty()) {
			
			TreeNode node = stack.peek();
			stack.pop();
			
			visited(node);
			
			if(root.right != null){
				stack.push(root.right);
			}
			
			if(root.left != null ) {
				stack.push(root.left);
			}
		}
		
	}

	public static void inOrderStack(TreeNode root){
		if(root == null)
			return ;
		
		/**
		 * 1.访问左子树
		 * 2.先访问根节点
		 * 3.访问右子树
		 * */
		
		Stack<TreeNode> stack = new Stack<TreeNode>();
		
		/*
		orderWhile(root.left);
		visited(root);
		orderWhile(root.right);
		*/
		
		TreeNode p = root;
		while(p != null) {
			stack.push(p);
			p = p.left;
		}
		while(!stack.empty()) {
			
			TreeNode node = stack.peek();
			stack.pop();
			visited(node);

			if(node.right != null) {
				stack.push(node.right);
				while(node.right.left != null)
					stack.push(node.right.left);
			}			
		}
		
		stack.push(root);
		while(!stack.empty()){
			
			//* push
			TreeNode node = stack.peek();
			while(node != null) {
				stack.push(node.left);
				node = node.left;
			}
			
			//visited
			stack.pop();
			if(!stack.empty()){
				node = stack.peek();
				stack.pop();
				visited(node);
				stack.push(node.right);
			}
			
			
			
			
			
		}
		
		
		
	}

	public static void postOrderStack(TreeNode root){
		if(root == null)
			return ;
		
		/**
		 * 1.访问左子树  
		 * 3.访问右子树
		 * */
		
		Stack<TreeNode> stack = new Stack<TreeNode>();
		
		/*
		orderWhile(root.left);
		visited(root);
		orderWhile(root.right);
		*/

	}
	
	
	
	private static void visited(TreeNode root) {
		System.out.println(root.x); //这里只是简单的打印下，可以做更多的操作：统计、计数等
	}
	
	
	public static void inOrder(TreeNode root){
		/**子树为空时，停止遍历*/
		if(root == null)
			return ; 
		/**
		 * 1.访问左子树
		 * 2.先访问根节点
		 * 3.访问右子树
		 * */
		preOrder(root.left);  // 把左子树看成一棵树、调用遍历方法
		visited(root); // 访问的方法
		preOrder(root.right); // 把右子树看成一棵树、调用遍历方法
	}
	
	public static void postOrder(TreeNode root){
		/**子树为空时，停止遍历*/
		if(root == null)
			return ; 
		/**
		 * 1.访问左子树
		 * 2.访问右子树
		 * 3.先访问根节点
		 * */
		preOrder(root.left);  // 把左子树看成一棵树、调用遍历方法
		preOrder(root.right); // 把右子树看成一棵树、调用遍历方法
		visited(root); // 访问的方法
	}

	
	
}

class TreeNode {
    int x;
    TreeNode left;   // 左子树
    TreeNode right; // 右子树
}