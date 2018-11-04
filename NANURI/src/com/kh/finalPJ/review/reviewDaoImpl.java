package com.kh.finalPJ.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalPJ.goods.goodsBbsDto;

@Repository
public class reviewDaoImpl implements reviewDao {

	@Autowired
	SqlSession sqlSession;

	private String namespace = "review.";

	/* 글 목록 */
	@Override
	public List<reviewDto> getreview() {

		List<reviewDto> list = sqlSession.selectList(namespace + "getreview");

		return list;
	}

	/* 페이징리스트 */
	@Override
	public List<reviewDto> getrevPagingList(reviewParam param) throws Exception {

		List<reviewDto> list = sqlSession.selectList(namespace + "getrevPagingList", param);
		// System.out.println(list.get(0).getG_img());

		return list;
	}

	@Override
	public int getrevCount(reviewParam param) throws Exception {
		int num = 0;
		num = sqlSession.selectOne(namespace + "getrevCount", param);
		return num;
	}

	/* 글 쓰기 */
	@Override
	public boolean writeReview(reviewDto dto) throws Exception {

		sqlSession.insert(namespace + "writeReview", dto);

		// System.out.println(dto.getContent());
		// System.out.println(dto.getId());
		// System.out.println(dto.getTitle());

		return true;
	}

	/* 디테일보기 */
	@Override
	public reviewDto detailreview(int seq) throws Exception {

		return sqlSession.selectOne(namespace + "detailreview", seq);
	}

	/* 후기에서 해당 페이지 가는~ */
	@Override
	public int godetail(reviewDto dto) throws Exception {
		int seq = sqlSession.selectOne(namespace + "godetail", dto);

		return seq;
	}

	/* 글삭제 */
	@Override
	public void deleterev(int seq) throws Exception {

		sqlSession.update(namespace + "deleterev", seq);

	}

	/* 글 수정 */
	@Override
	public void reviewupdate(reviewDto dto, int seq) throws Exception {
		sqlSession.update(namespace + "reviewupdate", dto);

	}

	/* 해당상품으로 가기 */
	@Override
	public int getGoodsSeq(String g_code) throws Exception {
		return sqlSession.selectOne(namespace + "getGoodsSeq", g_code);

	}

	@Override
	public reviewDto goToDto(int seq) throws Exception {
		return sqlSession.selectOne(namespace + "goToDto", seq);
	}

}
