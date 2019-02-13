using System;

namespace CranBerry.Models {
	/// <summary>
	/// Question Model
	/// </summary>
	public class Question {
		public int Id { get; set; } // 질문 일련번호

		public string Title { get; set; }   // 질문 제목

		public string Contents { get; set; } // 질문 내용

		public DateTime QuestionAt { get; set; }  // 질문 날짜

		public string UserID { get; set; }  // 등록자 ID

		public string Answer { get; set; }  // 답변 (답변이 없을 시 값: 0)
	}
}