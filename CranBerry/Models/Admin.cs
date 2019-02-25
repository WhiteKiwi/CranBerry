namespace CranBerry.Models {
	/// <summary>
	/// Model of admins table
	/// </summary>
	public class Admin {
		public string ID { get; set; } // 관리자 ID

		public string Password { get; set; } // 비밀번호

		public string Name { get; set; } // 이름
        public string OldPasswrod { get; set; } // 현재 비밀번호
        public string NewPassword { get; set; } // 새로운 비밀번호
	}
}
