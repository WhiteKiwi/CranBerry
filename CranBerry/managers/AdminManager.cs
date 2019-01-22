﻿using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace CranBerry.Managers {
	public static class AdminManager {
		/// <summary>
		/// Get Admin List
		/// </summary>
		public static List<Admin> GetAdmins() {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Admin> admins = new List<Admin>();

				string sql = "SELECT * FROM admins;";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var rdr = cmd.ExecuteReader();
				while (rdr.Read()) {
					admins.Add(new Admin {
						ID = (string)rdr["Id"],
						Name = (string)rdr["Name"]
					});
				}

				return admins;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}
	}
}