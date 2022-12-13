package site.metacoding.firstapp.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import site.metacoding.firstapp.domain.love.Love;
import site.metacoding.firstapp.domain.love.LoveDao;
import site.metacoding.firstapp.domain.post.PostDao;
import site.metacoding.firstapp.web.dto.request.post.PostSaveDto;
import site.metacoding.firstapp.web.dto.response.post.PostUpdateDto;

@RequiredArgsConstructor
@Service
public class PostService {
	private final LoveDao loveDao;
	private final PostDao postDao;

	public Love 좋아요(Love love) {
		loveDao.insert(love);
		return love;
	}

	public void 좋아요취소(Integer loveId) {
		loveDao.delete(loveId);
	}

	public void 게시글등록하기(PostSaveDto postSaveDto, Integer integer, MultipartFile file) throws Exception {

		int pos = file.getOriginalFilename().lastIndexOf(".");
		String extension = file.getOriginalFilename().substring(pos + 1);
		String filePath = "C:\\temp\\img\\";

		// 랜덤 키 생성
		String imgSaveName = UUID.randomUUID().toString();

		// 랜덤 키와 파일명을 합쳐 파일명 중복을 피함
		String imgName = imgSaveName + "." + extension;

		// 파일이 저장되는 폴더가 없으면 폴더를 생성
		File makeFileFolder = new File(filePath);
		if (!makeFileFolder.exists()) {
			if (!makeFileFolder.mkdir()) {
				throw new Exception("File.mkdir():Fail.");
			}
		}

		// 이미지 저장
		File dest = new File(filePath, imgName);
		try {
			Files.copy(file.getInputStream(), dest.toPath());
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("사진저장 실패");
		}
		postSaveDto.setPostThumnail(imgName);
		postDao.insertSave(postSaveDto);
	}

	public void 게시글수정하기(PostUpdateDto postUpdateDto, Integer userId, MultipartFile file) throws Exception {

		int pos = file.getOriginalFilename().lastIndexOf(".");
		String extension = file.getOriginalFilename().substring(pos + 1);
		String filePath = "C:\\temp\\img\\";

		// 랜덤 키 생성
		String imgSaveName = UUID.randomUUID().toString();

		// 랜덤 키와 파일명을 합쳐 파일명 중복을 피함
		String imgName = imgSaveName + "." + extension;

		// 파일이 저장되는 폴더가 없으면 폴더를 생성
		File makeFileFolder = new File(filePath);
		if (!makeFileFolder.exists()) {
			if (!makeFileFolder.mkdir()) {
				throw new Exception("File.mkdir():Fail.");
			}
		}

		// 이미지 저장
		File dest = new File(filePath, imgName);
		try {
			Files.copy(file.getInputStream(), dest.toPath());
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("사진저장 실패");
		}

		postUpdateDto.setPostThumnail(imgName);
		postDao.insertUpdate(postUpdateDto);
	}

	public void 썸네일없는게시글등록하기(PostSaveDto postSaveDto, Integer userId) {
		postDao.insertSave(postSaveDto);
	}

	public void 썸네일없는게시글로수정하기(PostUpdateDto postUpdateDto, Integer userId) {
		postDao.insertNoUpdate(postUpdateDto);
	}
}
