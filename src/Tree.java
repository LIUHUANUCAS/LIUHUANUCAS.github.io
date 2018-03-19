import java.util.Stack;


public class Tree {
	public static void preOrder(TreeNode root){
		/**����Ϊ��ʱ��ֹͣ����*/
		if(root == null)
			return ; 
		/**
		 * 1.�ȷ��ʸ��ڵ�
		 * 2.����������
		 * 3.����������
		 * */
		visited(root); // ���ʵķ���
		preOrder(root.left);  // ������������һ���������ñ�������
		preOrder(root.right); // ������������һ���������ñ�������
	}
	
	public static void preOrderStack(TreeNode root){
		if(root == null)
			return ;
		
		/**
		 * 1.�ȷ��ʸ��ڵ�
		 * 2.����������
		 * 3.����������
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
		 * 1.����������
		 * 2.�ȷ��ʸ��ڵ�
		 * 3.����������
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
		 * 1.����������  
		 * 3.����������
		 * */
		
		Stack<TreeNode> stack = new Stack<TreeNode>();
		
		/*
		orderWhile(root.left);
		visited(root);
		orderWhile(root.right);
		*/

	}
	
	
	
	private static void visited(TreeNode root) {
		System.out.println(root.x); //����ֻ�Ǽ򵥵Ĵ�ӡ�£�����������Ĳ�����ͳ�ơ�������
	}
	
	
	public static void inOrder(TreeNode root){
		/**����Ϊ��ʱ��ֹͣ����*/
		if(root == null)
			return ; 
		/**
		 * 1.����������
		 * 2.�ȷ��ʸ��ڵ�
		 * 3.����������
		 * */
		preOrder(root.left);  // ������������һ���������ñ�������
		visited(root); // ���ʵķ���
		preOrder(root.right); // ������������һ���������ñ�������
	}
	
	public static void postOrder(TreeNode root){
		/**����Ϊ��ʱ��ֹͣ����*/
		if(root == null)
			return ; 
		/**
		 * 1.����������
		 * 2.����������
		 * 3.�ȷ��ʸ��ڵ�
		 * */
		preOrder(root.left);  // ������������һ���������ñ�������
		preOrder(root.right); // ������������һ���������ñ�������
		visited(root); // ���ʵķ���
	}

	
	
}

class TreeNode {
    int x;
    TreeNode left;   // ������
    TreeNode right; // ������
}