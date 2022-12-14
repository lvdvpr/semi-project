package com.community.dao;
  
import java.util.List;
  
import com.community.vo.Position; import com.sample.util.SqlMapper;
  
  public class PositionDao {
  
  @SuppressWarnings("unchecked")
  public List<Position> getAllPositions() {
	  return (List<Position>) SqlMapper.selectList("getAllPositions"); 
	 } 
  
  public void updatePosition(Position position) {
	  SqlMapper.update("updatePosition",position);
  }
  
  public Position getPositionByNo(int positionNo) {
	  return (Position) SqlMapper.selectOne("getPositionByNo", positionNo);
  }
}
 