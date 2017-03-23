package com.ibaixiong.mall.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

public class ImgCutUtil {
	/**
	 * 对图片裁剪，并把裁剪完蛋新图片保存 。
	 * 
	 * @param key
	 *            源图片路径
	 * @param subpath
	 *            剪切图片存放路径
	 * @param x
	 *            剪切点x坐标
	 * @param y
	 *            剪切点y坐标
	 * @param width
	 *            剪切宽度
	 * @param height
	 *            剪切高度
	 * @throws IOException
	 */
	public static ByteArrayOutputStream cut(InputStream inputStream, int x, int y, int width, int height, String suffx) throws IOException {
		try {
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			BufferedImage image = ImageIO.read(inputStream);
			image = image.getSubimage(x, y, width, height);
			ImageIO.write(image, "jpg", out);
			return out;
		} finally {
			if (inputStream != null)
				inputStream.close();

		}
	}

	/**
	 * 
	 * @param image
	 * @param degree
	 *            旋转角度
	 * @param bgcolor
	 * @return
	 * @throws IOException
	 */
	public static InputStream rotateImg(BufferedImage image, int degree, Color bgcolor) throws IOException {

		int iw = image.getWidth();// 原始图象的宽度
		int ih = image.getHeight();// 原始图象的高度
		int w = 0;
		int h = 0;
		int x = 0;
		int y = 0;
		degree = degree % 360;
		if (degree < 0)
			degree = 360 + degree;// 将角度转换到0-360度之间
		double ang = Math.toRadians(degree);// 将角度转为弧度

		/**
		 * 确定旋转后的图象的高度和宽度
		 */

		if (degree == 180 || degree == 0 || degree == 360) {
			w = iw;
			h = ih;
		} else if (degree == 90 || degree == 270) {
			w = ih;
			h = iw;
		} else {
			// int d = iw + ih;
			// w = (int) (d * Math.abs(Math.cos(ang)));
			// h = (int) (d * Math.abs(Math.sin(ang)));
			double cosVal = Math.abs(Math.cos(ang));
			double sinVal = Math.abs(Math.sin(ang));
			w = (int) (sinVal * ih) + (int) (cosVal * iw);
			h = (int) (sinVal * iw) + (int) (cosVal * ih);
		}

		x = (w / 2) - (iw / 2);// 确定原点坐标
		y = (h / 2) - (ih / 2);
		BufferedImage rotatedImage = new BufferedImage(w, h, image.getType());
		Graphics2D gs = (Graphics2D) rotatedImage.getGraphics();
		if (bgcolor == null) {
			// rotatedImage =
			// gs.getDeviceConfiguration().createCompatibleImage(w, h,
			// Transparency.TRANSLUCENT);
			rotatedImage = gs.getDeviceConfiguration().createCompatibleImage(w, h);
		} else {
			gs.setColor(bgcolor);
			gs.fillRect(0, 0, w, h);// 以给定颜色绘制旋转后图片的背景
		}

		AffineTransform at = new AffineTransform();
		at.rotate(ang, w / 2, h / 2);// 旋转图象
		at.translate(x, y);
		AffineTransformOp op = new AffineTransformOp(at, AffineTransformOp.TYPE_BICUBIC);
		op.filter(image, rotatedImage);
		image = rotatedImage;

		ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		ImageOutputStream iamgeOut = ImageIO.createImageOutputStream(byteOut);
		ImageIO.write(image, "png", iamgeOut);
		InputStream inputStream = new ByteArrayInputStream(byteOut.toByteArray());

		return inputStream;
	}

	/**
	 * 旋转图片为指定角度
	 * 
	 * @param bufferedimage
	 *            目标图像
	 * @param degree
	 *            旋转角度
	 * @return
	 */
	public static BufferedImage rotateImage(final BufferedImage bufferedimage, final int degree) {
		int w = bufferedimage.getWidth();
		int h = bufferedimage.getHeight();
		int type = bufferedimage.getColorModel().getTransparency();
		BufferedImage img;
		Graphics2D graphics2d;
		(graphics2d = (img = new BufferedImage(w, h, type)).createGraphics()).setRenderingHint(RenderingHints.KEY_INTERPOLATION,
				RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		graphics2d.rotate(Math.toRadians(degree), w / 2, h / 2);
		graphics2d.drawImage(bufferedimage, 0, 0, null);
		graphics2d.dispose();
		return img;
	}
}
