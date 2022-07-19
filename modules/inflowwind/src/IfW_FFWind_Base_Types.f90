!STARTOFREGISTRYGENERATEDFILE 'IfW_FFWind_Base_Types.f90'
!
! WARNING This file is generated automatically by the FAST registry.
! Do not edit.  Your changes to this file will be lost.
!
! FAST Registry
!*********************************************************************************************************************************
! IfW_FFWind_Base_Types
!.................................................................................................................................
! This file is part of IfW_FFWind_Base.
!
! Copyright (C) 2012-2016 National Renewable Energy Laboratory
!
! Licensed under the Apache License, Version 2.0 (the "License");
! you may not use this file except in compliance with the License.
! You may obtain a copy of the License at
!
!     http://www.apache.org/licenses/LICENSE-2.0
!
! Unless required by applicable law or agreed to in writing, software
! distributed under the License is distributed on an "AS IS" BASIS,
! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
! See the License for the specific language governing permissions and
! limitations under the License.
!
!
! W A R N I N G : This file was automatically generated from the FAST registry.  Changes made to this file may be lost.
!
!*********************************************************************************************************************************
!> This module contains the user-defined types needed in IfW_FFWind_Base. It also contains copy, destroy, pack, and
!! unpack routines associated with each defined data type. This code is automatically generated by the FAST Registry.
MODULE IfW_FFWind_Base_Types
!---------------------------------------------------------------------------------------------------------------------------------
USE NWTC_Library
IMPLICIT NONE
! =========  IfW_FFWind_InitInputType  =======
  TYPE, PUBLIC :: IfW_FFWind_InitInputType
    INTEGER(IntKi)  :: ScaleMethod = 0      !< Turbulence scaling method [0=none, 1=direct scaling, 2= calculate scaling factor based on a desired standard deviation] [-]
    REAL(ReKi) , DIMENSION(1:3)  :: SF      !< Turbulence scaling factor for each direction [ScaleMethod=1] [-]
    REAL(ReKi) , DIMENSION(1:3)  :: SigmaF      !< Turbulence standard deviation to calculate scaling from in each direction [ScaleMethod=2] [-]
    INTEGER(IntKi)  :: WindProfileType = -1      !< Wind profile type (0=constant;1=logarithmic;2=power law) [-]
    REAL(ReKi)  :: RefHt = 0      !< Reference (hub) height of the grid [meters]
    REAL(ReKi)  :: URef = 0      !< Mean u-component wind speed at the reference height [meters]
    REAL(ReKi)  :: PLExp = 0      !< Power law exponent (used for PL wind profile type only) [-]
    REAL(ReKi)  :: Z0 = 0      !< Surface roughness length (used for LOG wind profile type only) [-]
    REAL(ReKi)  :: XOffset = 0      !< distance offset for FF wind files [m]
  END TYPE IfW_FFWind_InitInputType
! =======================
! =========  IfW_FFWind_ParameterType  =======
  TYPE, PUBLIC :: IfW_FFWind_ParameterType
    LOGICAL  :: Periodic = .FALSE.      !< Flag to indicate if the wind file is periodic [-]
    LOGICAL  :: InterpTower = .FALSE.      !< Flag to indicate if we should interpolate wind speeds below the tower [-]
    REAL(SiKi) , DIMENSION(:,:,:,:), ALLOCATABLE  :: FFData      !< Array of FF data [-]
    REAL(SiKi) , DIMENSION(:,:,:), ALLOCATABLE  :: FFTower      !< Array of data along tower, below FF array [-]
    REAL(ReKi)  :: FFDTime = 0      !< Delta time [seconds]
    REAL(ReKi)  :: FFRate = 0      !< Data rate (1/FFDTime) [Hertz]
    REAL(ReKi)  :: FFYHWid = 0      !< Half the grid width [meters]
    REAL(ReKi)  :: FFZHWid = 0      !< Half the grid height [meters]
    REAL(ReKi)  :: RefHt = 0      !< Reference (hub) height of the grid [meters]
    REAL(ReKi)  :: GridBase = 0      !< the height of the bottom of the grid [meters]
    REAL(ReKi)  :: InitXPosition = 0      !< the initial x position of grid (distance in FF is offset) [meters]
    REAL(ReKi)  :: InvFFYD = 0      !< reciprocal of delta y [1/meters]
    REAL(ReKi)  :: InvFFZD = 0      !< reciprocal of delta z [1/meters]
    REAL(ReKi)  :: InvMFFWS = 0      !< reciprocal of mean wind speed (MeanFFWS) [seconds/meter]
    REAL(ReKi)  :: MeanFFWS = 0      !< Mean wind speed (as defined in FF file), not necessarily of the portion used [meters/second]
    REAL(ReKi)  :: TotalTime = 0      !< The total time of the simulation [seconds]
    INTEGER(IntKi)  :: NFFComp = 3      !< Number of wind components [-]
    INTEGER(IntKi)  :: NFFSteps = 0      !< Number of time steps in the FF array [-]
    INTEGER(IntKi)  :: NYGrids = 0      !< Number of points in the lateral (y) direction of the grids [-]
    INTEGER(IntKi)  :: NZGrids = 0      !< Number of points in the vertical (z) direction of the grids [-]
    INTEGER(IntKi)  :: NTGrids = 0      !< Number of points in the vertical (z) direction on the tower (below the grids) [-]
    INTEGER(IntKi)  :: WindFileFormat      !< Binary file format description number [-]
    LOGICAL  :: AddMeanAfterInterp = .FALSE.      !< Add the mean wind speed after interpolating at a given height? [-]
    INTEGER(IntKi)  :: WindProfileType = -1      !< Wind profile type (0=constant;1=logarithmic;2=power law) [-]
    REAL(ReKi)  :: PLExp = 0      !< Power law exponent (used for PL wind profile type only) [-]
    REAL(ReKi)  :: Z0 = 0      !< Surface roughness length (used for LOG wind profile type only) [-]
  END TYPE IfW_FFWind_ParameterType
! =======================
CONTAINS
 SUBROUTINE IfW_FFWind_CopyInitInput( SrcInitInputData, DstInitInputData, CtrlCode, ErrStat, ErrMsg )
   TYPE(IfW_FFWind_InitInputType), INTENT(IN) :: SrcInitInputData
   TYPE(IfW_FFWind_InitInputType), INTENT(INOUT) :: DstInitInputData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
   INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
   INTEGER(IntKi)                 :: i3, i3_l, i3_u  !  bounds (upper/lower) for an array dimension 3
   INTEGER(IntKi)                 :: i4, i4_l, i4_u  !  bounds (upper/lower) for an array dimension 4
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'IfW_FFWind_CopyInitInput'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
    DstInitInputData%ScaleMethod = SrcInitInputData%ScaleMethod
    DstInitInputData%SF = SrcInitInputData%SF
    DstInitInputData%SigmaF = SrcInitInputData%SigmaF
    DstInitInputData%WindProfileType = SrcInitInputData%WindProfileType
    DstInitInputData%RefHt = SrcInitInputData%RefHt
    DstInitInputData%URef = SrcInitInputData%URef
    DstInitInputData%PLExp = SrcInitInputData%PLExp
    DstInitInputData%Z0 = SrcInitInputData%Z0
    DstInitInputData%XOffset = SrcInitInputData%XOffset
 END SUBROUTINE IfW_FFWind_CopyInitInput

 SUBROUTINE IfW_FFWind_DestroyInitInput( InitInputData, ErrStat, ErrMsg )
  TYPE(IfW_FFWind_InitInputType), INTENT(INOUT) :: InitInputData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  CHARACTER(*),    PARAMETER :: RoutineName = 'IfW_FFWind_DestroyInitInput'
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
! 
  ErrStat = ErrID_None
  ErrMsg  = ""
 END SUBROUTINE IfW_FFWind_DestroyInitInput

 SUBROUTINE IfW_FFWind_PackInitInput( ReKiBuf, DbKiBuf, IntKiBuf, Indata, ErrStat, ErrMsg, SizeOnly )
  REAL(ReKi),       ALLOCATABLE, INTENT(  OUT) :: ReKiBuf(:)
  REAL(DbKi),       ALLOCATABLE, INTENT(  OUT) :: DbKiBuf(:)
  INTEGER(IntKi),   ALLOCATABLE, INTENT(  OUT) :: IntKiBuf(:)
  TYPE(IfW_FFWind_InitInputType),  INTENT(IN) :: InData
  INTEGER(IntKi),   INTENT(  OUT) :: ErrStat
  CHARACTER(*),     INTENT(  OUT) :: ErrMsg
  LOGICAL,OPTIONAL, INTENT(IN   ) :: SizeOnly
    ! Local variables
  INTEGER(IntKi)                 :: Re_BufSz
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_BufSz
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_BufSz
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i,i1,i2,i3,i4,i5
  LOGICAL                        :: OnlySize ! if present and true, do not pack, just allocate buffers
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'IfW_FFWind_PackInitInput'
 ! buffers to store subtypes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)

  OnlySize = .FALSE.
  IF ( PRESENT(SizeOnly) ) THEN
    OnlySize = SizeOnly
  ENDIF
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_BufSz  = 0
  Db_BufSz  = 0
  Int_BufSz  = 0
      Int_BufSz  = Int_BufSz  + 1  ! ScaleMethod
      Re_BufSz   = Re_BufSz   + SIZE(InData%SF)  ! SF
      Re_BufSz   = Re_BufSz   + SIZE(InData%SigmaF)  ! SigmaF
      Int_BufSz  = Int_BufSz  + 1  ! WindProfileType
      Re_BufSz   = Re_BufSz   + 1  ! RefHt
      Re_BufSz   = Re_BufSz   + 1  ! URef
      Re_BufSz   = Re_BufSz   + 1  ! PLExp
      Re_BufSz   = Re_BufSz   + 1  ! Z0
      Re_BufSz   = Re_BufSz   + 1  ! XOffset
  IF ( Re_BufSz  .GT. 0 ) THEN 
     ALLOCATE( ReKiBuf(  Re_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating ReKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Db_BufSz  .GT. 0 ) THEN 
     ALLOCATE( DbKiBuf(  Db_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating DbKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Int_BufSz  .GT. 0 ) THEN 
     ALLOCATE( IntKiBuf(  Int_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating IntKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF(OnlySize) RETURN ! return early if only trying to allocate buffers (not pack them)

  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred = 1

    IntKiBuf(Int_Xferred) = InData%ScaleMethod
    Int_Xferred = Int_Xferred + 1
    DO i1 = LBOUND(InData%SF,1), UBOUND(InData%SF,1)
      ReKiBuf(Re_Xferred) = InData%SF(i1)
      Re_Xferred = Re_Xferred + 1
    END DO
    DO i1 = LBOUND(InData%SigmaF,1), UBOUND(InData%SigmaF,1)
      ReKiBuf(Re_Xferred) = InData%SigmaF(i1)
      Re_Xferred = Re_Xferred + 1
    END DO
    IntKiBuf(Int_Xferred) = InData%WindProfileType
    Int_Xferred = Int_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%RefHt
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%URef
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%PLExp
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%Z0
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%XOffset
    Re_Xferred = Re_Xferred + 1
 END SUBROUTINE IfW_FFWind_PackInitInput

 SUBROUTINE IfW_FFWind_UnPackInitInput( ReKiBuf, DbKiBuf, IntKiBuf, Outdata, ErrStat, ErrMsg )
  REAL(ReKi),      ALLOCATABLE, INTENT(IN   ) :: ReKiBuf(:)
  REAL(DbKi),      ALLOCATABLE, INTENT(IN   ) :: DbKiBuf(:)
  INTEGER(IntKi),  ALLOCATABLE, INTENT(IN   ) :: IntKiBuf(:)
  TYPE(IfW_FFWind_InitInputType), INTENT(INOUT) :: OutData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
    ! Local variables
  INTEGER(IntKi)                 :: Buf_size
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i
  INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
  INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
  INTEGER(IntKi)                 :: i3, i3_l, i3_u  !  bounds (upper/lower) for an array dimension 3
  INTEGER(IntKi)                 :: i4, i4_l, i4_u  !  bounds (upper/lower) for an array dimension 4
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'IfW_FFWind_UnPackInitInput'
 ! buffers to store meshes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred  = 1
    OutData%ScaleMethod = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    i1_l = LBOUND(OutData%SF,1)
    i1_u = UBOUND(OutData%SF,1)
    DO i1 = LBOUND(OutData%SF,1), UBOUND(OutData%SF,1)
      OutData%SF(i1) = ReKiBuf(Re_Xferred)
      Re_Xferred = Re_Xferred + 1
    END DO
    i1_l = LBOUND(OutData%SigmaF,1)
    i1_u = UBOUND(OutData%SigmaF,1)
    DO i1 = LBOUND(OutData%SigmaF,1), UBOUND(OutData%SigmaF,1)
      OutData%SigmaF(i1) = ReKiBuf(Re_Xferred)
      Re_Xferred = Re_Xferred + 1
    END DO
    OutData%WindProfileType = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%RefHt = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%URef = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%PLExp = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%Z0 = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%XOffset = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
 END SUBROUTINE IfW_FFWind_UnPackInitInput

 SUBROUTINE IfW_FFWind_CopyParam( SrcParamData, DstParamData, CtrlCode, ErrStat, ErrMsg )
   TYPE(IfW_FFWind_ParameterType), INTENT(IN) :: SrcParamData
   TYPE(IfW_FFWind_ParameterType), INTENT(INOUT) :: DstParamData
   INTEGER(IntKi),  INTENT(IN   ) :: CtrlCode
   INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
   CHARACTER(*),    INTENT(  OUT) :: ErrMsg
! Local 
   INTEGER(IntKi)                 :: i,j,k
   INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
   INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
   INTEGER(IntKi)                 :: i3, i3_l, i3_u  !  bounds (upper/lower) for an array dimension 3
   INTEGER(IntKi)                 :: i4, i4_l, i4_u  !  bounds (upper/lower) for an array dimension 4
   INTEGER(IntKi)                 :: ErrStat2
   CHARACTER(ErrMsgLen)           :: ErrMsg2
   CHARACTER(*), PARAMETER        :: RoutineName = 'IfW_FFWind_CopyParam'
! 
   ErrStat = ErrID_None
   ErrMsg  = ""
    DstParamData%Periodic = SrcParamData%Periodic
    DstParamData%InterpTower = SrcParamData%InterpTower
IF (ALLOCATED(SrcParamData%FFData)) THEN
  i1_l = LBOUND(SrcParamData%FFData,1)
  i1_u = UBOUND(SrcParamData%FFData,1)
  i2_l = LBOUND(SrcParamData%FFData,2)
  i2_u = UBOUND(SrcParamData%FFData,2)
  i3_l = LBOUND(SrcParamData%FFData,3)
  i3_u = UBOUND(SrcParamData%FFData,3)
  i4_l = LBOUND(SrcParamData%FFData,4)
  i4_u = UBOUND(SrcParamData%FFData,4)
  IF (.NOT. ALLOCATED(DstParamData%FFData)) THEN 
    ALLOCATE(DstParamData%FFData(i1_l:i1_u,i2_l:i2_u,i3_l:i3_u,i4_l:i4_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstParamData%FFData.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstParamData%FFData = SrcParamData%FFData
ENDIF
IF (ALLOCATED(SrcParamData%FFTower)) THEN
  i1_l = LBOUND(SrcParamData%FFTower,1)
  i1_u = UBOUND(SrcParamData%FFTower,1)
  i2_l = LBOUND(SrcParamData%FFTower,2)
  i2_u = UBOUND(SrcParamData%FFTower,2)
  i3_l = LBOUND(SrcParamData%FFTower,3)
  i3_u = UBOUND(SrcParamData%FFTower,3)
  IF (.NOT. ALLOCATED(DstParamData%FFTower)) THEN 
    ALLOCATE(DstParamData%FFTower(i1_l:i1_u,i2_l:i2_u,i3_l:i3_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
      CALL SetErrStat(ErrID_Fatal, 'Error allocating DstParamData%FFTower.', ErrStat, ErrMsg,RoutineName)
      RETURN
    END IF
  END IF
    DstParamData%FFTower = SrcParamData%FFTower
ENDIF
    DstParamData%FFDTime = SrcParamData%FFDTime
    DstParamData%FFRate = SrcParamData%FFRate
    DstParamData%FFYHWid = SrcParamData%FFYHWid
    DstParamData%FFZHWid = SrcParamData%FFZHWid
    DstParamData%RefHt = SrcParamData%RefHt
    DstParamData%GridBase = SrcParamData%GridBase
    DstParamData%InitXPosition = SrcParamData%InitXPosition
    DstParamData%InvFFYD = SrcParamData%InvFFYD
    DstParamData%InvFFZD = SrcParamData%InvFFZD
    DstParamData%InvMFFWS = SrcParamData%InvMFFWS
    DstParamData%MeanFFWS = SrcParamData%MeanFFWS
    DstParamData%TotalTime = SrcParamData%TotalTime
    DstParamData%NFFComp = SrcParamData%NFFComp
    DstParamData%NFFSteps = SrcParamData%NFFSteps
    DstParamData%NYGrids = SrcParamData%NYGrids
    DstParamData%NZGrids = SrcParamData%NZGrids
    DstParamData%NTGrids = SrcParamData%NTGrids
    DstParamData%WindFileFormat = SrcParamData%WindFileFormat
    DstParamData%AddMeanAfterInterp = SrcParamData%AddMeanAfterInterp
    DstParamData%WindProfileType = SrcParamData%WindProfileType
    DstParamData%PLExp = SrcParamData%PLExp
    DstParamData%Z0 = SrcParamData%Z0
 END SUBROUTINE IfW_FFWind_CopyParam

 SUBROUTINE IfW_FFWind_DestroyParam( ParamData, ErrStat, ErrMsg )
  TYPE(IfW_FFWind_ParameterType), INTENT(INOUT) :: ParamData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
  CHARACTER(*),    PARAMETER :: RoutineName = 'IfW_FFWind_DestroyParam'
  INTEGER(IntKi)                 :: i, i1, i2, i3, i4, i5 
! 
  ErrStat = ErrID_None
  ErrMsg  = ""
IF (ALLOCATED(ParamData%FFData)) THEN
  DEALLOCATE(ParamData%FFData)
ENDIF
IF (ALLOCATED(ParamData%FFTower)) THEN
  DEALLOCATE(ParamData%FFTower)
ENDIF
 END SUBROUTINE IfW_FFWind_DestroyParam

 SUBROUTINE IfW_FFWind_PackParam( ReKiBuf, DbKiBuf, IntKiBuf, Indata, ErrStat, ErrMsg, SizeOnly )
  REAL(ReKi),       ALLOCATABLE, INTENT(  OUT) :: ReKiBuf(:)
  REAL(DbKi),       ALLOCATABLE, INTENT(  OUT) :: DbKiBuf(:)
  INTEGER(IntKi),   ALLOCATABLE, INTENT(  OUT) :: IntKiBuf(:)
  TYPE(IfW_FFWind_ParameterType),  INTENT(IN) :: InData
  INTEGER(IntKi),   INTENT(  OUT) :: ErrStat
  CHARACTER(*),     INTENT(  OUT) :: ErrMsg
  LOGICAL,OPTIONAL, INTENT(IN   ) :: SizeOnly
    ! Local variables
  INTEGER(IntKi)                 :: Re_BufSz
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_BufSz
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_BufSz
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i,i1,i2,i3,i4,i5
  LOGICAL                        :: OnlySize ! if present and true, do not pack, just allocate buffers
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'IfW_FFWind_PackParam'
 ! buffers to store subtypes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)

  OnlySize = .FALSE.
  IF ( PRESENT(SizeOnly) ) THEN
    OnlySize = SizeOnly
  ENDIF
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_BufSz  = 0
  Db_BufSz  = 0
  Int_BufSz  = 0
      Int_BufSz  = Int_BufSz  + 1  ! Periodic
      Int_BufSz  = Int_BufSz  + 1  ! InterpTower
  Int_BufSz   = Int_BufSz   + 1     ! FFData allocated yes/no
  IF ( ALLOCATED(InData%FFData) ) THEN
    Int_BufSz   = Int_BufSz   + 2*4  ! FFData upper/lower bounds for each dimension
      Re_BufSz   = Re_BufSz   + SIZE(InData%FFData)  ! FFData
  END IF
  Int_BufSz   = Int_BufSz   + 1     ! FFTower allocated yes/no
  IF ( ALLOCATED(InData%FFTower) ) THEN
    Int_BufSz   = Int_BufSz   + 2*3  ! FFTower upper/lower bounds for each dimension
      Re_BufSz   = Re_BufSz   + SIZE(InData%FFTower)  ! FFTower
  END IF
      Re_BufSz   = Re_BufSz   + 1  ! FFDTime
      Re_BufSz   = Re_BufSz   + 1  ! FFRate
      Re_BufSz   = Re_BufSz   + 1  ! FFYHWid
      Re_BufSz   = Re_BufSz   + 1  ! FFZHWid
      Re_BufSz   = Re_BufSz   + 1  ! RefHt
      Re_BufSz   = Re_BufSz   + 1  ! GridBase
      Re_BufSz   = Re_BufSz   + 1  ! InitXPosition
      Re_BufSz   = Re_BufSz   + 1  ! InvFFYD
      Re_BufSz   = Re_BufSz   + 1  ! InvFFZD
      Re_BufSz   = Re_BufSz   + 1  ! InvMFFWS
      Re_BufSz   = Re_BufSz   + 1  ! MeanFFWS
      Re_BufSz   = Re_BufSz   + 1  ! TotalTime
      Int_BufSz  = Int_BufSz  + 1  ! NFFComp
      Int_BufSz  = Int_BufSz  + 1  ! NFFSteps
      Int_BufSz  = Int_BufSz  + 1  ! NYGrids
      Int_BufSz  = Int_BufSz  + 1  ! NZGrids
      Int_BufSz  = Int_BufSz  + 1  ! NTGrids
      Int_BufSz  = Int_BufSz  + 1  ! WindFileFormat
      Int_BufSz  = Int_BufSz  + 1  ! AddMeanAfterInterp
      Int_BufSz  = Int_BufSz  + 1  ! WindProfileType
      Re_BufSz   = Re_BufSz   + 1  ! PLExp
      Re_BufSz   = Re_BufSz   + 1  ! Z0
  IF ( Re_BufSz  .GT. 0 ) THEN 
     ALLOCATE( ReKiBuf(  Re_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating ReKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Db_BufSz  .GT. 0 ) THEN 
     ALLOCATE( DbKiBuf(  Db_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating DbKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF ( Int_BufSz  .GT. 0 ) THEN 
     ALLOCATE( IntKiBuf(  Int_BufSz  ), STAT=ErrStat2 )
     IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating IntKiBuf.', ErrStat, ErrMsg,RoutineName)
       RETURN
     END IF
  END IF
  IF(OnlySize) RETURN ! return early if only trying to allocate buffers (not pack them)

  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred = 1

    IntKiBuf(Int_Xferred) = TRANSFER(InData%Periodic, IntKiBuf(1))
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = TRANSFER(InData%InterpTower, IntKiBuf(1))
    Int_Xferred = Int_Xferred + 1
  IF ( .NOT. ALLOCATED(InData%FFData) ) THEN
    IntKiBuf( Int_Xferred ) = 0
    Int_Xferred = Int_Xferred + 1
  ELSE
    IntKiBuf( Int_Xferred ) = 1
    Int_Xferred = Int_Xferred + 1
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%FFData,1)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%FFData,1)
    Int_Xferred = Int_Xferred + 2
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%FFData,2)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%FFData,2)
    Int_Xferred = Int_Xferred + 2
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%FFData,3)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%FFData,3)
    Int_Xferred = Int_Xferred + 2
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%FFData,4)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%FFData,4)
    Int_Xferred = Int_Xferred + 2

      DO i4 = LBOUND(InData%FFData,4), UBOUND(InData%FFData,4)
        DO i3 = LBOUND(InData%FFData,3), UBOUND(InData%FFData,3)
          DO i2 = LBOUND(InData%FFData,2), UBOUND(InData%FFData,2)
            DO i1 = LBOUND(InData%FFData,1), UBOUND(InData%FFData,1)
              ReKiBuf(Re_Xferred) = InData%FFData(i1,i2,i3,i4)
              Re_Xferred = Re_Xferred + 1
            END DO
          END DO
        END DO
      END DO
  END IF
  IF ( .NOT. ALLOCATED(InData%FFTower) ) THEN
    IntKiBuf( Int_Xferred ) = 0
    Int_Xferred = Int_Xferred + 1
  ELSE
    IntKiBuf( Int_Xferred ) = 1
    Int_Xferred = Int_Xferred + 1
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%FFTower,1)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%FFTower,1)
    Int_Xferred = Int_Xferred + 2
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%FFTower,2)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%FFTower,2)
    Int_Xferred = Int_Xferred + 2
    IntKiBuf( Int_Xferred    ) = LBOUND(InData%FFTower,3)
    IntKiBuf( Int_Xferred + 1) = UBOUND(InData%FFTower,3)
    Int_Xferred = Int_Xferred + 2

      DO i3 = LBOUND(InData%FFTower,3), UBOUND(InData%FFTower,3)
        DO i2 = LBOUND(InData%FFTower,2), UBOUND(InData%FFTower,2)
          DO i1 = LBOUND(InData%FFTower,1), UBOUND(InData%FFTower,1)
            ReKiBuf(Re_Xferred) = InData%FFTower(i1,i2,i3)
            Re_Xferred = Re_Xferred + 1
          END DO
        END DO
      END DO
  END IF
    ReKiBuf(Re_Xferred) = InData%FFDTime
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%FFRate
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%FFYHWid
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%FFZHWid
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%RefHt
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%GridBase
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%InitXPosition
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%InvFFYD
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%InvFFZD
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%InvMFFWS
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%MeanFFWS
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%TotalTime
    Re_Xferred = Re_Xferred + 1
    IntKiBuf(Int_Xferred) = InData%NFFComp
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = InData%NFFSteps
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = InData%NYGrids
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = InData%NZGrids
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = InData%NTGrids
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = InData%WindFileFormat
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = TRANSFER(InData%AddMeanAfterInterp, IntKiBuf(1))
    Int_Xferred = Int_Xferred + 1
    IntKiBuf(Int_Xferred) = InData%WindProfileType
    Int_Xferred = Int_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%PLExp
    Re_Xferred = Re_Xferred + 1
    ReKiBuf(Re_Xferred) = InData%Z0
    Re_Xferred = Re_Xferred + 1
 END SUBROUTINE IfW_FFWind_PackParam

 SUBROUTINE IfW_FFWind_UnPackParam( ReKiBuf, DbKiBuf, IntKiBuf, Outdata, ErrStat, ErrMsg )
  REAL(ReKi),      ALLOCATABLE, INTENT(IN   ) :: ReKiBuf(:)
  REAL(DbKi),      ALLOCATABLE, INTENT(IN   ) :: DbKiBuf(:)
  INTEGER(IntKi),  ALLOCATABLE, INTENT(IN   ) :: IntKiBuf(:)
  TYPE(IfW_FFWind_ParameterType), INTENT(INOUT) :: OutData
  INTEGER(IntKi),  INTENT(  OUT) :: ErrStat
  CHARACTER(*),    INTENT(  OUT) :: ErrMsg
    ! Local variables
  INTEGER(IntKi)                 :: Buf_size
  INTEGER(IntKi)                 :: Re_Xferred
  INTEGER(IntKi)                 :: Db_Xferred
  INTEGER(IntKi)                 :: Int_Xferred
  INTEGER(IntKi)                 :: i
  INTEGER(IntKi)                 :: i1, i1_l, i1_u  !  bounds (upper/lower) for an array dimension 1
  INTEGER(IntKi)                 :: i2, i2_l, i2_u  !  bounds (upper/lower) for an array dimension 2
  INTEGER(IntKi)                 :: i3, i3_l, i3_u  !  bounds (upper/lower) for an array dimension 3
  INTEGER(IntKi)                 :: i4, i4_l, i4_u  !  bounds (upper/lower) for an array dimension 4
  INTEGER(IntKi)                 :: ErrStat2
  CHARACTER(ErrMsgLen)           :: ErrMsg2
  CHARACTER(*), PARAMETER        :: RoutineName = 'IfW_FFWind_UnPackParam'
 ! buffers to store meshes, if any
  REAL(ReKi),      ALLOCATABLE   :: Re_Buf(:)
  REAL(DbKi),      ALLOCATABLE   :: Db_Buf(:)
  INTEGER(IntKi),  ALLOCATABLE   :: Int_Buf(:)
    !
  ErrStat = ErrID_None
  ErrMsg  = ""
  Re_Xferred  = 1
  Db_Xferred  = 1
  Int_Xferred  = 1
    OutData%Periodic = TRANSFER(IntKiBuf(Int_Xferred), OutData%Periodic)
    Int_Xferred = Int_Xferred + 1
    OutData%InterpTower = TRANSFER(IntKiBuf(Int_Xferred), OutData%InterpTower)
    Int_Xferred = Int_Xferred + 1
  IF ( IntKiBuf( Int_Xferred ) == 0 ) THEN  ! FFData not allocated
    Int_Xferred = Int_Xferred + 1
  ELSE
    Int_Xferred = Int_Xferred + 1
    i1_l = IntKiBuf( Int_Xferred    )
    i1_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    i2_l = IntKiBuf( Int_Xferred    )
    i2_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    i3_l = IntKiBuf( Int_Xferred    )
    i3_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    i4_l = IntKiBuf( Int_Xferred    )
    i4_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    IF (ALLOCATED(OutData%FFData)) DEALLOCATE(OutData%FFData)
    ALLOCATE(OutData%FFData(i1_l:i1_u,i2_l:i2_u,i3_l:i3_u,i4_l:i4_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating OutData%FFData.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
      DO i4 = LBOUND(OutData%FFData,4), UBOUND(OutData%FFData,4)
        DO i3 = LBOUND(OutData%FFData,3), UBOUND(OutData%FFData,3)
          DO i2 = LBOUND(OutData%FFData,2), UBOUND(OutData%FFData,2)
            DO i1 = LBOUND(OutData%FFData,1), UBOUND(OutData%FFData,1)
              OutData%FFData(i1,i2,i3,i4) = REAL(ReKiBuf(Re_Xferred), SiKi)
              Re_Xferred = Re_Xferred + 1
            END DO
          END DO
        END DO
      END DO
  END IF
  IF ( IntKiBuf( Int_Xferred ) == 0 ) THEN  ! FFTower not allocated
    Int_Xferred = Int_Xferred + 1
  ELSE
    Int_Xferred = Int_Xferred + 1
    i1_l = IntKiBuf( Int_Xferred    )
    i1_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    i2_l = IntKiBuf( Int_Xferred    )
    i2_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    i3_l = IntKiBuf( Int_Xferred    )
    i3_u = IntKiBuf( Int_Xferred + 1)
    Int_Xferred = Int_Xferred + 2
    IF (ALLOCATED(OutData%FFTower)) DEALLOCATE(OutData%FFTower)
    ALLOCATE(OutData%FFTower(i1_l:i1_u,i2_l:i2_u,i3_l:i3_u),STAT=ErrStat2)
    IF (ErrStat2 /= 0) THEN 
       CALL SetErrStat(ErrID_Fatal, 'Error allocating OutData%FFTower.', ErrStat, ErrMsg,RoutineName)
       RETURN
    END IF
      DO i3 = LBOUND(OutData%FFTower,3), UBOUND(OutData%FFTower,3)
        DO i2 = LBOUND(OutData%FFTower,2), UBOUND(OutData%FFTower,2)
          DO i1 = LBOUND(OutData%FFTower,1), UBOUND(OutData%FFTower,1)
            OutData%FFTower(i1,i2,i3) = REAL(ReKiBuf(Re_Xferred), SiKi)
            Re_Xferred = Re_Xferred + 1
          END DO
        END DO
      END DO
  END IF
    OutData%FFDTime = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%FFRate = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%FFYHWid = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%FFZHWid = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%RefHt = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%GridBase = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%InitXPosition = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%InvFFYD = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%InvFFZD = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%InvMFFWS = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%MeanFFWS = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%TotalTime = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%NFFComp = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%NFFSteps = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%NYGrids = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%NZGrids = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%NTGrids = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%WindFileFormat = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%AddMeanAfterInterp = TRANSFER(IntKiBuf(Int_Xferred), OutData%AddMeanAfterInterp)
    Int_Xferred = Int_Xferred + 1
    OutData%WindProfileType = IntKiBuf(Int_Xferred)
    Int_Xferred = Int_Xferred + 1
    OutData%PLExp = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
    OutData%Z0 = ReKiBuf(Re_Xferred)
    Re_Xferred = Re_Xferred + 1
 END SUBROUTINE IfW_FFWind_UnPackParam

END MODULE IfW_FFWind_Base_Types
!ENDOFREGISTRYGENERATEDFILE