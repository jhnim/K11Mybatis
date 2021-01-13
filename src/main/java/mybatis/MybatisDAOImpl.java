package mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface MybatisDAOImpl {
	
	////// 1차버전에서 사용
	//검색기능 추가 전
	/*
	//게시물 갯수 카운트하기
	public int getTotalCount();
	
	//게시물을 select해서 List로 반환하기
	public ArrayList<MyBoardDTO> listPage(int s, int e);
	*/
	
	//////2차버전에서 사용
	//검색기능 추가 후 : 파라미터를 저장한 DTO를 매개변수로 받음
	public int getTotalCount(ParameterDTO parameterDTO);
	public ArrayList<MyBoardDTO> listPage(ParameterDTO parameterDTO);
	
	
	/*
	 Mapper에서 파라미터를 전달한 이름 그대로 사용할 수 있도옥 @Param어노테이션을 사용한다.
	 */
	public int write(@Param("_name") String name, @Param("_contents") String contents, @Param("_id") String id);
	
	//기존게시물 조회
	public MyBoardDTO view(ParameterDTO parameterDTO);
	
	/*
	 Mapper에서 update, delete는 모두 정수형의 반환값이 있지만 필요없는 경우 사용하지 않아도 된다.
	 */
	public int modify(MyBoardDTO myBoardDTO);
	
	public int delete(String idx, String id);
}
