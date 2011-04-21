!-----------------------------------------------------------------------------|
!    Consists a part of MRD Program - Multi Rotor Vehicle Design, see MRD.f90 |
!    Copyright (C) 2011  Murat BRONZ                                          |
!                                                                             |
!    This program is free software; you can redistribute it and/or modify     |
!    it under the terms of the GNU General Public License as published by     |
!    the Free Software Foundation; either version 2 of the License, or        |
!    (at your option) any later version.                                      |
!                                                                             |
!    This program is distributed in the hope that it will be useful,          |
!    but WITHOUT ANY WARRANTY; without even the implied warranty of           |
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            |
!    GNU General Public License for more details.                             |
!                                                                             |
!    You should have received a copy of the GNU General Public License along  |
!    with this program; if not, write to the Free Software Foundation, Inc.,  |
!    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.              |
!-----------------------------------------------------------------------------|
	SUBROUTINE MFRAME
	USE MCOMMON
	IMPLICIT NONE

	WRITE(*,*)' Frame Building Subroutine '
!--- Fixed Frame Weight for Type 10---

		WRITE(*,*)M_frame_fix
	IF (M_frame_fix .Eq. 0) THEN 
		CALL ESTIMATE_MASS()
	ELSE 
		M_frame = M_frame_fix
	END IF


	END SUBROUTINE MFRAME

	SUBROUTINE ESTIMATE_MASS
	USE MCOMMON
	IMPLICIT NONE

	Real :: framespan, volume

	framespan = SQRT(((2.3*PROP_RADIUS)*(1.2*PROP_RADIUS))/2)

	SELECT CASE (FRAME_SHAPE)
	CASE(0)
		SELECT CASE (FRAME_MAT)
			CASE(0)	
				volume = (0.088 *framespan)*(0.035 *framespan)*framespan*4
				M_frame = volume *1.333/1000+ 0.05
			CASE(1)	
				volume = (0.088 *framespan)*(0.035 *framespan)*framespan*4
				M_frame = volume *1.4/1000+ 0.05
			CASE(2)
				volume = (0.2 *framespan)*(0.3 *framespan)*framespan*4
				M_frame = volume *0.333/1000+ 0.05
		END SELECT	
	CASE(1)
	END SELECT

	WRITE(*,*)'M_FRAME', M_FRAME

	END SUBROUTINE ESTIMATE_MASS
