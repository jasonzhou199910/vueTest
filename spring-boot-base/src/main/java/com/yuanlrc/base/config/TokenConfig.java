package com.yuanlrc.base.config;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@ConfigurationProperties(prefix = "config.jwt")
@Component
public class TokenConfig {

	private long expire;

	private String secret;

	public String createToken() {
		Algorithm algorithm = Algorithm.HMAC256(secret);
		Map<String, Object> ret = new HashMap<String, Object>();
		Date nowDate = new Date();
		//过期时间
		Date expireDate = new Date(nowDate.getTime() + 30 * 1000);
		ret.put("alg", "HS256");
		ret.put("typ", "JWT");
		String token = JWT.create()
				.withHeader(ret)// 设置头部信息 Header
				.withIssuer("SERVICE")//设置 载荷 签名是有谁生成 例如 服务器
				.withSubject("yuanlrcToken")//设置 载荷 签名的主题
				// .withNotBefore(new Date())//设置 载荷 定义在什么时间之前，该jwt都是不可用的.
				.withAudience("APP")//设置 载荷 签名的观众 也可以理解谁接受签名的
				.withIssuedAt(nowDate) //设置 载荷 生成签名的时间
				.withExpiresAt(expireDate)//设置 载荷 签名过期的时间
				.withClaim("loginName", "yuanlarc")
				.withClaim("userName", "猿来入此")
				.sign(algorithm);//签名 Signature
		return token;
	}

	public Boolean verifyToken(String token) {
		Boolean isExpire = true;
		try {
			Algorithm algorithm = Algorithm.HMAC256(secret);
			JWTVerifier verifier = JWT.require(algorithm).withIssuer("SERVICE").build(); // Reusable verifier instance
			DecodedJWT jwt = verifier.verify(token);
			String subject = jwt.getSubject();
			List<String> audience = jwt.getAudience();
			Map<String, Claim> claims = jwt.getClaims();
			for (Map.Entry<String, Claim> entry : claims.entrySet()) {
				String key = entry.getKey();
				Claim claim = entry.getValue();
				System.out.println("key:" + key + " value:" + claim.asString());
			}
			Claim claim = claims.get("loginName");
			System.out.println(claim.asString());
			System.out.println(subject);
			System.out.println(audience.get(0));
		} catch (TokenExpiredException e) {
			isExpire = false;
		}
		return isExpire;
	}


	public long getExpire() {
		return expire;
	}

	public void setExpire(long expire) {
		this.expire = expire;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public boolean isTokenExpired(Date expirationTime) {
		return expirationTime.before(new Date());
	}
}
