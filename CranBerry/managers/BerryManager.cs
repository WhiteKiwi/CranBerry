using CranBerry.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CranBerry.Managers {
	public static class BerryManager //Beryy 추가
	{
		public static int AddBerry(Berry berry) {

			int result = 0;
            

            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			try {
				MySqlCommand cmd = new MySqlCommand();
				cmd.Connection = con;
                cmd.CommandText = string.Format("insert into berries(Title,Contents,Classification)values('{0}','{1}','{2}')", berry.Title, berry.Contents, berry.Classification);
				con.Open();
				result = cmd.ExecuteNonQuery();
				return result;
			} catch (Exception e) {
				throw new Exception(e.Message);
			} finally {
				con.Close();
			}
		}

		public static int ModifyBerry(Berry berry) //베리 수정
		{
			MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			MySqlCommand cmd = new MySqlCommand();
			try {
				int result = 0;
				cmd.Connection = con;
				cmd.CommandText = string.Format("SELECT berries FROM  WHERE Id = " + berry.Id);
				con.Open();
				//베리 업데이트
				cmd.CommandText = string.Format("update berries set Contents='{0}', Title={1} where Id='{2}'", berry.Contents, berry.Title, berry.Id);
				result = cmd.ExecuteNonQuery();
				return result;

			} catch (Exception e) {
				throw new Exception(e.Message);
			} finally {
				con.Close();
			}
		}
		public static int DeleteBerry(Berry berry) // 베리삭제
			{
			MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
			MySqlCommand cmd = new MySqlCommand();
			try {
				int result = 0;
				cmd.Connection = con;
				cmd.CommandText = string.Format("Delete From berries Where Id={0}", berry.Id);
				con.Open();
				result = cmd.ExecuteNonQuery();
				return result;

			} catch (Exception e) {
				throw new Exception(e.Message);
			} finally {
				con.Close();
			}
		}

		/// <summary>
		/// Get Berry by Id
		/// </summary>
		public static Berry GetBerryByID(int id) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				string sql = "SELECT * FROM berries WHERE Id='" + id + "';";
				MySqlCommand cmd = new MySqlCommand(sql, conn);

				var dr = cmd.ExecuteReader();
				dr.Read();

				// TODO: Berry가 없을 경우

				Berry result = new Berry {
					Id = (int)dr["Id"],
					Title = (string)dr["Title"],
					Contents = (string)dr["Contents"]
				};

				// 조회수 증가
				sql = "UPDATE berries SET Views='" + ((int)dr["Views"] + 1) + "' WHERE Id='" + id + "';";
				dr.Close();
				cmd.CommandText = sql;
				cmd.ExecuteNonQuery();

				return result;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}

		/// <summary>
		/// Get Berries by Classification
		/// 목록 렌더링을 위해 제목과 글번호만 반환
		/// </summary>
		public static List<Berry> GetBerriesByClassification(Classification classification) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				List<Berry> berryList = new List<Berry>();

				// Get Berries
				int classificationIndex = 0;
				switch (classification) {
					case Classification.Event:
						classificationIndex = 0;
						break;
					case Classification.Facilities:
						classificationIndex = 1;
						break;
					case Classification.CNSATerms:
						classificationIndex = 2;
						break;
					case Classification.CNSALifeAndStudy:
						classificationIndex = 3;
						break;
					case Classification.Dormitory:
						classificationIndex = 4;
						break;
					case Classification.Club:
						classificationIndex = 5;
						break;
					case Classification.Group:
						classificationIndex = 6;
						break;
					case Classification.Contest:
						classificationIndex = 7;
						break;
					default:
						classificationIndex = 0;
						break;
				}
				string sql = "SELECT Id, Title FROM berries WHERE Classification='" + classificationIndex + "';";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				var dr = cmd.ExecuteReader();
				while (dr.Read()) {
					berryList.Add(new Berry {
						Id = (int)dr["Id"],
						Title = (string)dr["Title"]
					});
				}

				return berryList;
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}

		/// <summary>
		/// Edit Berry by Id
		/// </summary>
		public static void EditBerry(int id, string contents) {
			MySqlConnection conn = null;
			try {
				// Connect to DB;
				conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["CranBerry"].ConnectionString);
				conn.Open();

				string sql = "UPDATE berries SET Contents='" + contents + "' WHERE Id='" + id + "';";
				MySqlCommand cmd = new MySqlCommand(sql, conn);
				cmd.ExecuteNonQuery();
			} catch (Exception e) {
				// TODO: 예외 처리
				throw new Exception(e.Message);
			} finally {
				conn.Close();
			}
		}
	}
}

