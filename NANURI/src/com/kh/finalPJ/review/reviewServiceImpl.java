package com.kh.finalPJ.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalPJ.goods.goodsBbsDto;

@Service
public class reviewServiceImpl implements reviewService {

	@Autowired
	reviewDao reviewDao;

	/* 글 목록 */
	@Override
	public List<reviewDto> getreview() throws Exception {

		return reviewDao.getreview();
	}

	/* 페이징리스트 */
	@Override
	public List<reviewDto> getrevPagingList(reviewParam param) throws Exception {
		return reviewDao.getrevPagingList(param);
	}

	@Override
	public int getrevCount(reviewParam param) throws Exception {

		return reviewDao.getrevCount(param);
	}

	/* 글 쓰기 */
	@Override
	public boolean writeReview(reviewDto dto) throws Exception {

		return reviewDao.writeReview(dto);
	}

	/* 디테일보기 */
	@Override
	public reviewDto detailreview(int seq) throws Exception {

		return reviewDao.detailreview(seq);
	}

	/* 후기에서 해당 페이지 가는~ */
	@Override
	public int godetail(reviewDto dto) throws Exception {

		return reviewDao.godetail(dto);
	}

	/* 글삭제 */
	@Override
	public void deleterev(int seq) throws Exception {

		reviewDao.deleterev(seq);
	}

	/* 글 수정 */
	@Override
	public void reviewupdate(reviewDto dto, int seq) throws Exception {

		reviewDao.reviewupdate(dto, seq);

	}

	/* 해당상품으로 가기 */
	@Override
	public int getGoodsSeq(String g_code) throws Exception {

		return reviewDao.getGoodsSeq(g_code);
	}

	@Override
	public reviewDto goToDto(int seq) throws Exception {
		return reviewDao.goToDto(seq);
	}

}
