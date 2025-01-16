package Day23;

class AA{
	private static  AA instance = new AA(); 
	// 단 한개만 객체만 생성할수있게  
	// static 붙이는 이유 : 클래스 메서드에서 접근하기위해서는 클래스 변수로 변경해야함 
	private AA(){
		//private 키워드를 통해서 new 라는 키워드 사용하지 못하게 막음 
	}
	public static AA getInstance() { //참조값을 받을수있게 get메서드 
		return instance;
		//참조값을 넘겨줘야함 하지만 static 이 없을경우 인스턴스 메서드는 객체를 생성해 참조값을 통해서만 접근할 수 있으니 
		//static 으로 클래스 메서드로 변경 
	}
	
	
}

public class Ex2301 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//AA obj1 = new AA(); //private 키워드를 통해서 new 라는 키워드 사용하지 못하게 막음 
		//AA obj1 = AA.getInstance();
		
	}

}
